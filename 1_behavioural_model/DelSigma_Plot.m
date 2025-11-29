%% Simulation

simOut = sim('DelSigma_Model');
logs = simOut.logsout;

%% Data Extraction 
% Extracting signals from Simulink model, input sine wave, loop-filter, quantizer and
% DSM output
u   = squeeze(logs.getElement('inputLog').Values.Data);
y   = squeeze(logs.getElement('filterLog').Values.Data);
v   = squeeze(logs.getElement('quantLog').Values.Data);
dsm = squeeze(logs.getElement('dsmLog').Values.Data);
t   = logs.getElement('inputLog').Values.Time;

Nplot = 100;
if length(t) < Nplot
    Nplot = length(t);
end

t1   = t(1:Nplot);
u1   = u(1:Nplot);
y1   = y(1:Nplot);
v1   = v(1:Nplot);
dsm1 = dsm(1:Nplot);

%% Plots
figure('Name', 'Delta Sigma Modulator 1st Order');

plot(t1, y1, 'g-', 'LineWidth', 1.5, 'DisplayName', 'Loop Filter'); 
hold on;
stairs(t1, v1, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Comparator');
plot(t1, u1, 'b-', 'LineWidth', 2.5, 'DisplayName', 'Input Signal');

grid on;
title('Delta Sigma Modulator 1st Order')
ylabel('Amplitude');
legend('show');
ylim([-2 2]);

figure;
stairs(t1, dsm1, 'b-', 'LineWidth', 2, 'DisplayName', 'DSM Bitstream');
title('DSM Output Bitstream');
xlabel('Time (s)');
ylabel('Amplitude');
legend('show');
ylim([-3 3]);
