clear; clc; close all;

% Design Targets
Target_Gm      = 31.42e-6;   % 31.42 uS
Target_Itail   = 6.28e-6;    % 6.28 uA
Target_UGB     = 5.0e6;      % 5 MHz
C_load         = 1e-12;      % 1 pF

% File paths
dataDir  = 'simulations';
opFile   = fullfile(dataDir, 'op_data.txt');
acFile   = fullfile(dataDir, 'ota_ac_data.txt');
tranFiles = {'ota_tran_small.txt', 'ota_tran_large.txt'};

% AC Analysis
fprintf('\n[2] AC ANALYSIS\n');
if isfile(acFile)
    ac_raw = readmatrix(acFile);
    freq = ac_raw(:, 1);
    
    v_outp = ac_raw(:, 2) + 1j*ac_raw(:, 3);
    v_outn = ac_raw(:, 5) + 1j*ac_raw(:, 6);
    v_inp  = ac_raw(:, 8) + 1j*ac_raw(:, 9);
    v_inn  = ac_raw(:, 11) + 1j*ac_raw(:, 12);
    
    H = (v_outp - v_outn) ./ (v_inp - v_inn);
    mag_db = 20*log10(abs(H));
    phase_deg = unwrap(angle(H)) * (180/pi);
    
    dc_gain = mag_db(1);
    [~, idx_gbw] = min(abs(mag_db));
    sim_gbw = freq(idx_gbw);
    sim_pm  = 180 + phase_deg(idx_gbw);
    
    fprintf('   DC Gain:             %8.2f dB\n', dc_gain);
    fprintf('   GBW:                 %8.2f MHz (Target: %.2f MHz)\n', sim_gbw/1e6, Target_UGB/1e6);
    fprintf('   Phase Margin:        %8.2f deg\n', sim_pm);

    figure('Name', 'AC Analysis', 'NumberTitle', 'off', 'Position', [150 150 1000 700]);
    subplot(2,1,1);
    semilogx(freq, mag_db, 'k', 'LineWidth', 2.5, 'DisplayName', 'Frequency Response');
    hold on;
    xline(sim_gbw, '-', 'LineWidth', 2, 'Color', 'b', 'DisplayName', sprintf('Simulated GBW: %.2f MHz', sim_gbw/1e6));
    xline(Target_UGB, '--', 'LineWidth', 2, 'Color', 'r', 'DisplayName', sprintf('Target GBW: %.2f MHz', Target_UGB/1e6));
    yline(0, ':', 'LineWidth', 1.5, 'Color', [0.7 0.7 0.7], 'HandleVisibility', 'off');
    
    text(freq(1)*1.5, dc_gain-5, sprintf('DC Gain = %.2f dB', dc_gain), 'FontSize', 11, 'FontWeight', 'bold', 'Color', 'm');
    grid on;
    title('Bode Magnitude', 'FontSize', 13, 'FontWeight', 'bold');
    xlabel('Frequency (Hz)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Gain (dB)', 'FontSize', 12, 'FontWeight', 'bold');
    legend('Location', 'best', 'FontSize', 10);
    hold off;
    
    subplot(2,1,2);
    semilogx(freq, phase_deg, 'k', 'LineWidth', 2.5, 'DisplayName', 'Phase Response');
    hold on;
    
    yline(-105, '--', 'Color', 'r', 'LineWidth', 2, 'DisplayName', '75° PM (ideal)');
    xline(sim_gbw, '-', 'LineWidth', 2, 'Color', 'b', 'DisplayName', sprintf('@ GBW: PM = %.1f°', sim_pm));
    
    grid on;
    title('Bode Phase', 'FontSize', 13, 'FontWeight', 'bold');
    xlabel('Frequency (Hz)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Phase (deg)', 'FontSize', 12, 'FontWeight', 'bold');
    legend('Location', 'best', 'FontSize', 10);
    hold off;
else
    fprintf('   ac_data.txt not found.\n');
end

% TRANSIENT ANALYSIS
fprintf('\n[3] TRANSIENT ANALYSIS\n');
for fileIdx = 1:length(tranFiles)
    tranFile = fullfile(dataDir, tranFiles{fileIdx});
    
    fprintf(tranFiles{fileIdx});
    isSmallSignal = (fileIdx == 1);  % flag: small-signal = BW-limited, large-signal = SR-limited
    if isfile(tranFile)

        tran_raw  = readmatrix(tranFile);
        t         = tran_raw(:, 1);
        v_outp    = tran_raw(:, 2);
        v_outn    = tran_raw(:, 4);
        v_inp_sig = tran_raw(:, 10);
        v_inn_sig = tran_raw(:, 12);
        
        vdiff_in  =  v_inp_sig - v_inn_sig;
        vdiff_out =  v_outp - v_outn;   
        vcm_out   =  (v_outp + v_outn) / 2;
   
        t_step = 10e-9;   
        t_end  = 510e-9;  
        
        pre_mask  = t >= 0 & t < (t_step - 1e-9);            
        post_mask = t > 400e-9 & t < 500e-9;                 
        
        v_initial   = mean(vdiff_out(pre_mask));
        v_final     = mean(vdiff_out(post_mask));
        actual_step = v_final - v_initial;
        
        expected_step = mean(vdiff_in(post_mask)) - mean(vdiff_in(pre_mask));
        
        fprintf('   Initial Vdiff_out:   %8.4f mV\n', v_initial*1e3);
        fprintf('   Final   Vdiff_out:   %8.4f mV\n', v_final*1e3);
        fprintf('   Actual Step:         %8.4f mV  (Expected: %.1f mV)\n', ...
                actual_step*1e3, expected_step*1e3);
                
        % ---- 10% / 90% crossings 
        v10 = v_initial + 0.10 * actual_step;
        v90 = v_initial + 0.90 * actual_step;
        
        search_mask = t >= t_step & t <= (t_end - 5e-9);
        t_srch    = t(search_mask);
        vout_srch = vdiff_out(search_mask);
        
        %step is positive (rising) or negative (falling)
        if actual_step > 0
            idx_10 = find(vout_srch >= v10, 1, 'first');
            idx_90 = find(vout_srch >= v90, 1, 'first');
        else
            idx_10 = find(vout_srch <= v10, 1, 'first');
            idx_90 = find(vout_srch <= v90, 1, 'first');
        end
        
        if ~isempty(idx_10) && ~isempty(idx_90)
            t10 = t_srch(idx_10);
            t90 = t_srch(idx_90);
            if t90 > t10
                rise_time = t90 - t10;
            else
                dt_sim    = mean(diff(t));
                rise_time = dt_sim;
                fprintf('   NOTE: Rise < 1 timestep (%.0f ps) — rise time is a lower bound.\n', dt_sim*1e12);
            end
        else
            rise_time = NaN;
        end

        dt_sim = mean(diff(t));
        win = max(3, round(1e-9 / dt_sim));
        dvdt_raw    = [0; diff(vdiff_out) ./ diff(t)];
        dvdt_smooth = movmean(dvdt_raw, win);

        slew_window_end = t_step + 250e-9;
        slew_mask_sr    = t >= t_step & t <= slew_window_end;
        dvdt_slew       = dvdt_smooth(slew_mask_sr);
        if actual_step > 0
            SR_sim = max(dvdt_slew);
        else
            SR_sim = min(dvdt_slew);
        end

        SR_theory = Target_Itail / C_load;
        
        settle_mask = t > t_step & t < t_end;
        vout_s = vdiff_out(settle_mask);
        t_s    = t(settle_mask);
        
        if actual_step > 0
            v_peak = max(vout_s);
        else
            v_peak = min(vout_s);
        end
        overshoot = max(0, (v_peak - v_final) / actual_step * 100);
        
        tol_1   = 0.010 * abs(actual_step);
        tol_01  = 0.001 * abs(actual_step);
        
        bad_1  = find(abs(vout_s - v_final) > tol_1,  1, 'last');
        bad_01 = find(abs(vout_s - v_final) > tol_01, 1, 'last');
        
        t_settled_1  = NaN;  
        t_settled_01 = NaN;
        if ~isempty(bad_1) && bad_1 < length(t_s)
            t_settled_1 = t_s(bad_1+1) - t_step; 
        end
        if ~isempty(bad_01) && bad_01 < length(t_s)
            t_settled_01 = t_s(bad_01+1) - t_step; 
        end
        
        if isSmallSignal
            fprintf('   Slew Rate:            [N/A — response is bandwidth-limited, not slew-rate limited]\n');
        else
            fprintf('   Peak Slew Rate:       %8.4f V/us  (Theory = %.4f V/us)\n', abs(SR_sim)/1e6, SR_theory/1e6);
        end
        fprintf('   Rise Time (10-90%%):  %8.4f ns\n',  rise_time*1e9);
        fprintf('   Overshoot:            %8.2f %%\n',   overshoot);
        if ~isnan(t_settled_1)
            fprintf('   Settling Time (1%%):  %8.4f ns\n',  t_settled_1*1e9);
        else
            fprintf('   Settling Time (1%%):  not reached\n');
        end
        
        figName1 = sprintf('Transient Full View - %s', tranFiles{fileIdx});
        figure('Name', figName1, 'NumberTitle','off','Position',[100 80 1050 900]);
        
        subplot(3,1,1);
        plot(t*1e6, vdiff_in*1e3,  'b--', 'LineWidth', 1.8, 'DisplayName', 'V_{in,diff}'); hold on;
        plot(t*1e6, vdiff_out*1e3, 'k',   'LineWidth', 2.5, 'DisplayName', 'V_{out,diff}');
        grid on; title(sprintf('Differential Step Response (%s)', tranFiles{fileIdx}), 'FontSize',13,'FontWeight','bold');
        xlabel('Time (\mus)','FontSize',12,'FontWeight','bold'); ylabel('Voltage (mV)','FontSize',12,'FontWeight','bold');
        legend('Location','best','FontSize',9); hold off;
        
        subplot(3,1,2);
        plot(t*1e6, v_outp,  'r',   'LineWidth',2,   'DisplayName','V_{outp}'); hold on;
        plot(t*1e6, v_outn,  'b',   'LineWidth',2,   'DisplayName','V_{outn}');
        plot(t*1e6, vcm_out, 'k--', 'LineWidth',1.5, 'DisplayName','V_{cm,out}');
        yline(1.5, ':', 'Color',[0.5 0.5 0.5], 'LineWidth',1.2, 'DisplayName','V_{CM,ref} = 1.5 V');
        grid on; title('Single-Ended Output Voltages','FontSize',13,'FontWeight','bold');
        xlabel('Time (\mus)','FontSize',12,'FontWeight','bold'); ylabel('Voltage (V)','FontSize',12,'FontWeight','bold');
        legend('Location','best','FontSize',9); hold off;
        
        subplot(3,1,3);
        plot(t*1e6, dvdt_smooth/1e6, 'k', 'LineWidth',2, 'DisplayName','dV_{out}/dt (smoothed)'); hold on;
        grid on; title('Instantaneous Slew Rate', 'FontSize',13,'FontWeight','bold');
        xlabel('Time (\mus)','FontSize',12,'FontWeight','bold'); ylabel('Slew Rate (V/\mus)','FontSize',12,'FontWeight','bold');
        legend('Location','best','FontSize',9); hold off;
        
        if ~isSmallSignal
            if ~isnan(rise_time)
                zoom_half = max(500e-9, 2 * rise_time);
            else
                zoom_half = 500e-9;
            end
            zoom_mask = t >= (t_step - 20e-9) & t <= (t_step + zoom_half);
            t_z    = t(zoom_mask);
            vout_z = vdiff_out(zoom_mask);
            vin_z  = vdiff_in(zoom_mask);
            dvdt_z = dvdt_smooth(zoom_mask);

            figName2 = sprintf('Transient Zoomed Edge - %s', tranFiles{fileIdx});
            figure('Name', figName2, 'NumberTitle','off','Position',[200 100 1000 700]);

            subplot(2,1,1);
            plot((t_z - t_step)*1e9, vin_z*1e3,  'b--', 'LineWidth',1.8, 'DisplayName','V_{in,diff}'); hold on;
            plot((t_z - t_step)*1e9, vout_z*1e3, 'k',   'LineWidth',2.5, 'DisplayName','V_{out,diff}');

            yline(v10*1e3, '--', 'Color',[0.6 0.6 0.6], 'LineWidth',1.2, 'DisplayName','10% level');
            yline(v90*1e3, '--', 'Color',[0.3 0.3 0.3], 'LineWidth',1.2, 'DisplayName','90% level');
            grid on;
            title(sprintf('Zoomed Edge (Large Signal) | Rise Time = %.2f ns | Peak SR = %.3f V/\\mus', ...
                rise_time*1e9, abs(SR_sim)/1e6), 'FontSize',13,'FontWeight','bold');
            xlabel('Time relative to step edge (ns)','FontSize',12,'FontWeight','bold');
            ylabel('Voltage (mV)','FontSize',12,'FontWeight','bold');
            legend('Location','best','FontSize',9); hold off;

            subplot(2,1,2);
            plot((t_z - t_step)*1e9, dvdt_z/1e6, 'k', 'LineWidth',2, 'DisplayName','dV_{out}/dt'); hold on;
            yline(SR_theory/1e6, '--', 'Color','r', 'LineWidth',1.8, ...
                'DisplayName', sprintf('Theory SR = %.2f V/\\mus', SR_theory/1e6));
            grid on;
            title('Slew Rate — Zoomed (Large Signal)','FontSize',13,'FontWeight','bold');
            xlabel('Time relative to step edge (ns)','FontSize',12,'FontWeight','bold');
            ylabel('Slew Rate (V/\mus)','FontSize',12,'FontWeight','bold');
            legend('Location','best','FontSize',9); hold off;
        end
        
    else
        fprintf('   File %s not found.\n', tranFile);
    end
end