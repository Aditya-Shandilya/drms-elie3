clear; clc; close all;

% Design Targets
Target_Gm      = 94.25e-6;   % 94.25 uS
Target_Itail   = 9.42e-6;    % 9.42 uA
Target_Itop    = 9.42e-6;    % 9.42 uA
Target_UGB     = 5.0e6;      % 5 MHz
C_load         = 3e-12;      % 3 pF

% File paths
dataDir  = 'simulations';
opFile   = fullfile(dataDir, 'op_data.txt');
acFile   = fullfile(dataDir, 'ota_ac_data.txt');
tranFile = fullfile(dataDir, 'ota_tran_data.txt');

colors.cyan      = [0.3 0.9 0.9];    % Bright cyan
colors.orange    = [1.0 0.6 0.2];    % Bright orange
colors.lime      = [0.6 1.0 0.3];    % Bright lime green
colors.magenta   = [1.0 0.4 0.8];    % Bright magenta
colors.yellow    = [1.0 0.9 0.2];    % Bright yellow
colors.red       = [1.0 0.3 0.3];    % Bright red
colors.green     = [0.4 1.0 0.4];    % Bright green
colors.blue      = [0.4 0.7 1.0];    % Bright blue

% Operating Point Analysis
fprintf('\n[1] OPERATING POINT CHECK\n');
if isfile(opFile)
    op_raw = readmatrix(opFile);
    
    all_vals = op_raw(~isnan(op_raw));
    
    if mod(length(all_vals), 2) == 0
        vals = all_vals(2:2:end);
    else
        vals = all_vals(abs(all_vals) < 1e-3);
    end
    
    if length(vals) >= 4
        val_Itail   = abs(vals(1)); % M3 Tail current
        val_Iinput  = abs(vals(2)); % M1 Input current
        val_Gm      = abs(vals(3)); % M1 Gm
        val_Itop    = abs(vals(4)); % M10 Top source
        
        fprintf('%-22s | %-13s | %-13s | %s\n', 'PARAMETER', 'SIMULATED', 'TARGET', 'DEVIATION (%)');
        fprintf('--------------------------------------------------------------------\n');
        
        % Tail Current
        err_tail = abs(val_Itail - Target_Itail)/Target_Itail * 100;
        fprintf('%-22s | %8.2f uA   | %8.2f uA   | %.2f%%\n', 'Tail Current (M3)', val_Itail*1e6, Target_Itail*1e6, err_tail);
        
        % Top Source Current
        err_top = abs(val_Itop - Target_Itop)/Target_Itop * 100;
        fprintf('%-22s | %8.2f uA   | %8.2f uA   | %.2f%%\n', 'Top Source (M10)', val_Itop*1e6, Target_Itop*1e6, err_top);

        % Transconductance
        err_gm = abs(val_Gm - Target_Gm)/Target_Gm * 100;
        fprintf('%-22s | %8.2f uS   | %8.2f uS   | %.2f%%\n', 'Input Gm (M1)', val_Gm*1e6, Target_Gm*1e6, err_gm);
        
        % Input Branch Current
        expected_Iinput = Target_Itail / 2;
        err_input = abs(val_Iinput - expected_Iinput)/expected_Iinput * 100;
        fprintf('%-22s | %8.2f uA   | %8.2f uA   | %.2f%%\n', 'Input Branch (M1)', val_Iinput*1e6, expected_Iinput*1e6, err_input);
        
    else
        fprintf('   Not enough data values found.\n');
    end
else
    fprintf('   op_data.txt not found.\n');
end

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
    semilogx(freq, mag_db, 'Color', colors.cyan, 'LineWidth', 2.5, 'DisplayName', 'Frequency Response'); 
    hold on;
    xline(sim_gbw, '-', 'LineWidth', 2, 'Color', colors.lime, 'DisplayName', sprintf('Simulated GBW: %.2f MHz', sim_gbw/1e6));
    xline(Target_UGB, '--', 'LineWidth', 2, 'Color', colors.orange, 'DisplayName', sprintf('Target GBW: %.2f MHz', Target_UGB/1e6));
    yline(0, ':', 'LineWidth', 1.5, 'Color', [0.7 0.7 0.7], 'HandleVisibility', 'off');
    grid on;
    title('Bode Magnitude', 'FontSize', 13, 'FontWeight', 'bold'); 
    ylabel('Gain (dB)', 'FontSize', 12, 'FontWeight', 'bold');
    legend('Location', 'best', 'FontSize', 10);
    hold off;
    
    subplot(2,1,2); 
    semilogx(freq, phase_deg, 'Color', colors.cyan, 'LineWidth', 2.5, 'DisplayName', 'Phase Response'); 
    hold on;
    
    yline(-120, '--', 'Color', colors.green, 'LineWidth', 2, 'DisplayName', '60° PM (minimum)');
    yline(-105, '--', 'Color', colors.yellow, 'LineWidth', 2, 'DisplayName', '75° PM (ideal)');
    yline(-135, ':', 'Color', colors.red, 'LineWidth', 1.5, 'DisplayName', '45° PM (too low)');
    xline(sim_gbw, '-', 'LineWidth', 2, 'Color', colors.lime, 'DisplayName', sprintf('@ GBW: PM = %.1f°', sim_pm));
    
    grid on;
    title('Bode Phase', 'FontSize', 13, 'FontWeight', 'bold'); 
    xlabel('Frequency (Hz)', 'FontSize', 12, 'FontWeight', 'bold'); 
    ylabel('Phase (deg)', 'FontSize', 12, 'FontWeight', 'bold');
    legend('Location', 'best', 'FontSize', 10);
    hold off;
else
    fprintf('   ac_data.txt not found.\n');
end

% Transient Analysis
fprintf('\n[3] TRANSIENT ANALYSIS\n');
if isfile(tranFile)
    tran_raw = readmatrix(tranFile);
    
    t = tran_raw(:, 1); 
    
    outp = tran_raw(:, 2); 
    outn = tran_raw(:, 4);
    inp  = tran_raw(:, 6); 
    inn  = tran_raw(:, 8);
    
    vod = outp - outn; 
    vid = inp - inn;
    
    step_mv = (max(vid) - min(vid)) * 1000;
    slope = gradient(vod) ./ gradient(t);
    threshold = 0.5 * max(abs(slope));
    slew_region_indices = abs(slope) > threshold;
    measured_sr = median(abs(slope(slew_region_indices)));
    
    fprintf('   Input Step:          %8.2f mV\n', step_mv);
    
    figure('Name', 'Transient Analysis', 'NumberTitle', 'off', 'Position', [200 200 1000 700]);
    
    subplot(2,1,1); 
    plot(t*1e6, vid*1000, 'Color', colors.lime, 'LineWidth', 2.5, 'DisplayName', 'Differential Input'); 
    grid on;
    title(sprintf('Differential Input (Step = %.2f mV)', step_mv), ...
          'FontSize', 13, 'FontWeight', 'bold'); 
    ylabel('Voltage (mV)', 'FontSize', 12, 'FontWeight', 'bold');
    legend('Location', 'best', 'FontSize', 11);
    
    subplot(2,1,2); 
    plot(t*1e6, vod*1000, 'Color', colors.cyan, 'LineWidth', 2.5, 'DisplayName', 'Output Response'); 
    hold on;
    
    if step_mv >= 10 && exist('val_Itail', 'var')

        expected_sr = (2 * val_Itail) / C_load;
        
        fprintf('   Slew Rate (Meas):    %8.2f V/us\n', measured_sr/1e6);
        fprintf('   Expected SR (2*I/C): %8.2f V/us\n', expected_sr/1e6);
        
        sr_error = abs(measured_sr - expected_sr)/expected_sr * 100;
        fprintf('   SR Deviation:        %8.2f%%\n', sr_error);
        
        mid_idx = floor(median(find(slew_region_indices)));
        if isnan(mid_idx), mid_idx = round(length(t)/2); end
        
        t_center = t(mid_idx);
        v_center = vod(mid_idx);
        t_line = [t_center - 0.5e-6, t_center + 0.5e-6]; 
        
        %y = mx + c  ->  y = m(x - x1) + y1
        v_line_meas = measured_sr * (t_line - t_center) + v_center;
        v_line_exp  = expected_sr * (t_line - t_center) + v_center;
        
        if vod(end) < vod(1), v_line_meas = -v_line_meas; v_line_exp = -v_line_exp; end

        plot(t_line*1e6, v_line_meas*1000, '--', 'Color', colors.magenta, 'LineWidth', 2.0, 'DisplayName', sprintf('Measured Slope: %.2f V/us', measured_sr/1e6));
             
        plot(t_line*1e6, v_line_exp*1000, ':', 'Color', colors.orange, 'LineWidth', 2.0, 'DisplayName', sprintf('Expected Slope: %.2f V/us', expected_sr/1e6));
        
        title(sprintf('Output Response (Slew Rate = %.2f V/µs)', measured_sr/1e6), 'FontSize', 13, 'FontWeight', 'bold');
    else
        fprintf('   Slew Rate:           N/A (small signal or missing OP data)\n');
        title('Output Response (Small Signal)', 'FontSize', 13, 'FontWeight', 'bold');
    end
    
    grid on;
    xlabel('Time (µs)', 'FontSize', 12, 'FontWeight', 'bold'); 
    ylabel('Voltage (mV)', 'FontSize', 12, 'FontWeight', 'bold');
    legend('Location', 'best', 'FontSize', 11);
    hold off;
else
    fprintf('   ota_tran_data.txt not found.\n');
end