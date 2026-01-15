clc; clearvars; close all;

filename = fullfile('simulations', 'sodsm_data.txt');
data = readmatrix(filename);


t_ms  = data(:,1) * 1000; % Time in ms
v_in  = data(:,2);        % Input (Column 2)
v_int1 = data(:,4);       % Integrator 1 (Column 4)
v_int2 = data(:,6);       % Integrator 2 (Column 6)
v_out = data(:,8);        % Bitstream (Column 8)

figure('Name', '2nd Order Delta Sigma Modulator');
hold on;
box on;

% Plotting both integrators
h_in   = plot(t_ms, v_in, 'b', 'LineWidth', 2, 'DisplayName', 'Input Signal');
h_int1 = plot(t_ms, v_int1, 'g', 'LineWidth', 0.5, 'DisplayName', 'Integrator 1');
h_int2 = plot(t_ms, v_int2, 'm', 'LineWidth', 0.5, 'DisplayName', 'Integrator 2'); % Magenta
h_comp = stairs(t_ms, v_out, 'r', 'LineWidth', 0.5, 'DisplayName', 'Comparator Out');

xlabel('Time (ms)', 'FontSize', 12);
ylabel('Amplitude (V)', 'FontSize', 12);
title('Second-Order Delta Sigma Modulator Transient Analysis', 'FontSize', 14);

legend([h_in, h_int1, h_int2, h_comp], 'Location', 'northeast');

grid on;
xlim([0 1.5]); 
ylim([-1 4]); % Adjusted for typical 0-3V range
set(gca, 'FontSize', 12);