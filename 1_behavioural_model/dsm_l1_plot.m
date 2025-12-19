clc;
clearvars;
close all;

% Simulation Parameters
fs = 1e6;               %Sampling frequency
Ts = 1/fs;              % Time step
N  = 9001;             % Simulation length
M  = 512;                % Oversampling Ratio
cycles = 10;            % Number of signal cycles 
A  = 0.8;               % Signal amplitude
offset = 0;

fx = cycles * fs / N;   % Input frequency 
fB = fs / (2 * M);      % Signal Bandwidth

SamplingFrequency = fs; 
OLgain = 1000;        % Open Loop Gain
a = 1;                % Feedforward
b = [1 1];            % Feedback
c = 1;                % Integrator

% This section fixes the "Negative SNR" by forcing Simulink to use our fs and fx
modelName = 'dsm_l1_sim';
load_system(modelName);

% Find blocks safely (handles potential name variations)
sineBlock = find_system(modelName, 'BlockType', 'Sin');
if ~isempty(sineBlock)
    set_param(sineBlock{1}, 'Frequency', num2str(2 * pi * fx)); 
    set_param(sineBlock{1}, 'SampleTime', num2str(Ts));
    set_param(sineBlock{1}, 'Amplitude', num2str(A));
end

filterBlock = find_system(modelName, 'BlockType', 'DiscreteFilter');
if ~isempty(filterBlock)
    set_param(filterBlock{1}, 'SampleTime', num2str(Ts));
end

%% Run Simulation
fprintf('Running simulation for 1000 Hz input...\n');
T_stop = (N-1) * Ts;

% Create a simulation input object
in = Simulink.SimulationInput(modelName);

% Explicitly push your variables into the simulation's scope
in = in.setVariable('OLgain', OLgain);
in = in.setVariable('a', a);
in = in.setVariable('b', b);
in = in.setVariable('c', c);
in = in.setVariable('SamplingFrequency', SamplingFrequency);

% Set the stop time via the object
in = in.setModelParameter('StopTime', num2str(T_stop));

simOut = sim(in);
logs = simOut.logsout;

% Extract exactly N samples
u   = squeeze(logs.getElement('inputLog').Values.Data);
y   = squeeze(logs.getElement('filterLog').Values.Data);
v   = squeeze(logs.getElement('quantLog').Values.Data);
dsm = squeeze(logs.getElement('dsmLog').Values.Data);
t   = logs.getElement('inputLog').Values.Time;

% Calculate points to plot to show ~1.5ms 
N_plot = ceil(1.5e-3 * fs); 
if length(t) < N_plot, N_plot = length(t); end

t1   = t(1:N_plot);
u1   = u(1:N_plot);
y1   = y(1:N_plot);
v1   = v(1:N_plot);
dsm1 = dsm(1:N_plot);

%% Plotting 
figure('Name', 'Delta Sigma modulator', 'Color', 'w');

plot(t1, y1, 'g-', 'LineWidth', 1.5, 'DisplayName', 'Loop Filter'); 
hold on;
stairs(t1, v1, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Comparator');
plot(t1, u1, 'b-', 'LineWidth', 2.5, 'DisplayName', 'Input Signal');

grid on;
title('Delta Sigma modulator (Simulink Output)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('show', 'Location', 'northeast');
ylim([-2 2]);
xlim([0 t1(end)]);

%% Spectral Analysis & SNR Calculation

% Windowing (Hann window to suppress spectral leakage)
w = hann(N);
dsm_windowed = dsm .* w;

% FFT Calculation
% Calculate normalization factor for window
norm_factor = sum(w); 

% Compute FFT and convert to Magnitude
X = abs(fft(dsm_windowed));
X_mag = X(1:N/2) * 2 / norm_factor; % Single-sided magnitude spectrum
X_db  = 20*log10(X_mag);

% SNR Calculation (In-Band)
% Signal Bin (DC is bin 1, Fundamental is bin 1+cycles)
bin_sig = 1 + cycles;

% Bandwidth Bin (Limit for In-Band Noise)
bin_bw  = floor(fB * N / fs);

% Define Noise Bins: From DC+1 up to Bandwidth, EXCLUDING signal bin
span = 1; 
noise_indices = 2:bin_bw; 
sig_indices   = (bin_sig - span) : (bin_sig + span);
noise_indices = setdiff(noise_indices, sig_indices);

% Calculate Power
P_signal = sum(X_mag(sig_indices).^2);
P_noise  = sum(X_mag(noise_indices).^2);

%SNR
SNR_dB = 10 * log10(P_signal / P_noise);

fprintf('Simulation N:      %d samples\n', N);
fprintf('Input Frequency:   %.2f Hz\n', fx);
fprintf('Signal Bandwidth:  %.2f Hz (Bin %d)\n', fB, bin_bw);
fprintf('Signal Power:      %.2f dB\n', 10*log10(P_signal));
fprintf('In-Band Noise:     %.2f dB\n', 10*log10(P_noise));
fprintf('CALCULATED SNR:    %.2f dB\n', SNR_dB);

f_axis = (0:N/2-1) * (fs / N);
figure('Name', 'DSM Power Spectral Density');
semilogx(f_axis, X_db, 'b');
hold on;
xline(fB, '--r', 'LineWidth', 2, 'Label', 'Bandwidth');
xline(fx, '--g', 'LineWidth', 1.5, 'Label', 'Signal');
grid on;
xlim([f_axis(2) fs/2]); % Plot from first bin to Nyquist
ylim([-160 10]);
title(['PSD (SNR = ' num2str(SNR_dB, '%.1f') ' dB, OSR = ' num2str(M) ')']);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');