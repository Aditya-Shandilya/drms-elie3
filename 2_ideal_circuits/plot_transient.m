clc; clearvars; close all;

filename = fullfile('simulations', 'dsm_data.txt');
data = readmatrix(filename);

% Columns: 1=Time, 2=Vin, 3=Time, 4=Vint, 5=Time, 6=ModOut
t_ms = data(:,1) * 1000; % Time in ms
v_in = data(:,2);        % Input (Blue)
v_int = data(:,4);       % Integrator (Green)
v_out = data(:,6);       % Bitstream (Red)

figure('Name', 'Delta Sigma Modulator (Simulink Style)');
hold on;
box on;

h_comp = stairs(t_ms, v_out, 'r', 'LineWidth', 0.5, 'DisplayName', 'Comparator');
h_int = plot(t_ms, v_int, 'g', 'LineWidth', 0.5, 'DisplayName', 'Loop Filter');
h_in = plot(t_ms, v_in, 'b', 'LineWidth', 2, 'DisplayName', 'Input Signal');

xlabel('Time (ms)', 'FontSize', 12);
ylabel('Amplitude (V)', 'FontSize', 12);
title('Delta Sigma Modulator Output', 'FontSize', 14);

legend([h_int, h_comp, h_in], 'Location', 'northeast');
grid on;

xlim([0 1.5]); 
ylim([-2 5]); 

set(gca, 'FontSize', 12); % Make text readable