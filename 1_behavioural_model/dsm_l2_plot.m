%Second Order Delta Sigma Modulator

%% Init
clc;
clearvars;
close all;

%% Simulation Parameters
L=2;
form='CIFB';
fs = 1e6;               % Sampling frequency
Ts = 1/fs;              % Sampling Time
M  = 512;               % Oversampling Ratio
N  = 64*M;              % Number of Samples
cycles = 5;             % Number of signal cycles 
A  = 0.8;               % Signal amplitude
offset = 0;

fx = cycles * fs / N;   % Input frequency 
fB = fs / (2 * M);      % Signal Bandwidth

OLgain = 1000;        % Open Loop Gain

%%Calculating the coefficients
H = synthesizeNTF(L, M);
[a, g, b, c] = realizeNTF(H, form);
b(2:end) = 0;
ABCD = stuffABCD(a, g, b, c, form);
[ABCDs umax] = scaleABCD(ABCD);   %coefficients are scaled for hardware implementation
[a, g, b, c] = mapABCD(ABCDs, form);

%% This section forces Simulink to uses fs and fx
modelName = 'dsm_l2_sim';
load_system(modelName);
%open_system(modelName);

%Sine block is overwritten by Freq, SampleTime
%and Amplitude in MATLAB code.

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
T_stop = (N-1) * Ts;

% Simulation input object
in = Simulink.SimulationInput(modelName);

% Explicitly pushing variables into the simulation's scope
in = in.setVariable('OLgain', OLgain);
in = in.setVariable('a', a);
in = in.setVariable('b', b);
in = in.setVariable('c', c);
in = in.setVariable('g', g);
in = in.setVariable('SamplingFrequency', fs);

% Set the stop time via the object
in = in.setModelParameter('StopTime', num2str(T_stop));

simOut = sim(in);
logs = simOut.logsout;

% Extract outputs
dsmOut = simOut.yout.get('dsmOut').Values.Data;
filterOut = simOut.yout.get('filterOut').Values.Data;
quantOut = simOut.yout.get('quantOut').Values.Data;
u   = squeeze(logs.getElement('inputLog').Values.Data);
v = squeeze(logs.getElement('dsmLog').Values.Data);
t   = logs.getElement('inputLog').Values.Time;

% Calculate points to plot to show ~1.5ms
N_plot = ceil(6.7e-3 * fs); % Number of samples= Time (1.5ms) * Sample frequency (fs)
if length(t) < N_plot, N_plot = length(t); end

%Using values till N_plot for better graph visualisation
t1   = t(1:N_plot);
filterOut1   = filterOut(1:N_plot);
dsmOut1   = dsmOut(1:N_plot);
quantOut1   = quantOut(1:N_plot);
u1 = u(1:N_plot);

%% Plotting 
figure('Name', 'Delta Sigma modulator', 'Color', 'w');

plot(t1, filterOut1, 'g-', 'LineWidth', 1.5, 'DisplayName', 'Loop Filter'); 
hold on;
stairs(t1, quantOut1, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Comparator');
plot(t1, u1, 'b-', 'LineWidth', 2.5, 'DisplayName', 'Input Signal');

grid on;
title('Delta Sigma modulator (Simulink Output)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('show', 'Location', 'northeast');
ylim([-2 2]);
xlim([0 t1(end)]);

%%Pole Zero Plot using NTF
figure('Name', 'NTF Characteristics', 'Color', 'w');

% Plot 1: Pole-Zero Map
subplot(1,2,1);
[zeros_ntf, poles_ntf] = zpkdata(H, 'v'); 
zplane(zeros_ntf, poles_ntf); 
grid on;
title('NTF Pole-Zero Map');

% Plot 2: Magnitude Response of the NTF
subplot(1,2,2);
f_plot = linspace(0, 0.5, 1000); % Normalized frequency
% Calculate frequency response
H_f = evalTF(H, exp(2j*pi*f_plot));
semilogx(f_plot*fs/1e3, 20*log10(abs(H_f)), 'b', 'LineWidth', 2);
grid on;
xline(fB/1e3, '--r', 'Bandwidth');
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');
title('NTF Magnitude Response');
%% Spectral Analysis & SNR Calculation (Using Hann Windowing)

% Windowing (Hann window to suppress spectral leakage)
w = hann(N);
dsm_windowed = dsmOut .* w;

% FFT Calculation
% Calculate normalization factor for window
norm_factor = sum(w); 

% Compute FFT and convert to Magnitude
X = abs(fft(dsm_windowed));
X_mag = X(1:N/2) * 2 / norm_factor; % Single-sided magnitude spectrum
X_db  = 20*log10(X_mag);

f = linspace(0, 0.5, N/2 + 1); % Normalized frequency vector
z = exp(2i * pi * f);          % Frequency domain representation
figure('Name', 'Bode Plot');
plot(f, dbv(evalTF(H, z)), 'LineWidth', 2);
grid on;
title('Bode Plot of NTF');
xlabel('Normalized Frequency (f/fs)');
ylabel('Magnitude (dB)');f = [0:N/2-1]/N;

% SNR Calculation (In-Band)
% Signal Bin (DC is bin 1, Fundamental is bin 1+cycles)
bin_sig = 1 + cycles;

% Bandwidth Bin 
bin_bw  = floor(fB * N / fs);

% Noise Bins: From DC+1 up to Bandwidth, excluding signal bin
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

fprintf('Coefficient a:      %d \n', a);
fprintf('Coefficient b:      %d \n', b);
fprintf('Coefficient c:      %d \n', c);
fprintf('Coefficient g:      %d \n', g);

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

%% Decimation filter
% Taking signal v as input which is output of SDM.
% x_sine -> SDM -> v -> SINC3 -> DCF -> HBF1 -> HBF2 -> I2C_out

% SINC3
Nsinc = 64; % downsampling ratio
h1 = zeros(1, Nsinc);
h1(1:Nsinc) = 1/Nsinc;
hsinc1 = ones(1, Nsinc)*1/Nsinc;
hsinc2 = conv(hsinc1, hsinc1);
hsinc3 = conv(hsinc1, hsinc2);
% Force normalization to 0 dB at DC
hsinc3 = hsinc3 / sum(hsinc3);

%% Filter SDM output
% This stage takes the high-speed bitstream and reduces it by Nsinc (64)
Sinc3outOrg = conv(hsinc3, v);
Sinc3out = downsample(Sinc3outOrg, Nsinc);

%% Droop correction filter (DCF)
DCF = fdesign.decimator(Nsinc, 'ciccomp', 1, 3, 'n,fc,ap,ast', 12, 0.45, 0.05, 60);
Hdcf = design(DCF, 'equiripple', 'SystemObject', true);
DCFnum = Hdcf.Numerator;
[DCFfreq, w3] = freqz(DCFnum, 1); %freq response
[DCFimp, tw3] = impz(DCFnum, 1);  %impulse response

%% Filter operation
DCFout = conv(Sinc3out, DCFimp);

%% Half-band filter 1 (HBF1)
FsHBF1 = fs/Nsinc;
HBF1taps = 26;
HBF1num = firhalfband(HBF1taps, 0.25);
[hbf1f, w1] = freqz(HBF1num, 1);
[hbf1t, tw1] = impz(HBF1num, 1);
HBF1outOrg = conv(DCFout, hbf1t);
HBF1out = downsample(HBF1outOrg, 2);

%% Half-band filter 2 (HBF2)
FsHBF2 = FsHBF1/2;
HBF2taps = 50;
HBF2num = firhalfband(HBF2taps, 0.25);
[hbf2f, w2] = freqz(HBF2num, 1);
[hbf2t, tw2] = impz(HBF2num, 1);
HBF2outOrg = conv(HBF1out, hbf2t);
HBF2out = downsample(HBF2outOrg, 2);

figure('Color','w','Name','DSM vs Decimated Output');

subplot(2,1,1);
stairs(v(1:300));
grid on;
title('DSM Bitstream Output v[n]');
ylabel('Amplitude');

subplot(2,1,2);
plot(HBF2out, 'LineWidth', 1.5);
grid on;
title('Final Decimated Output');
xlabel('Sample index');
ylabel('Amplitude');


%% Frequency analysis of Decimated Output
% Parameters for the Decimated Signal
fs_dec = fs / (Nsinc * 4);  
N_dec = length(HBF2out);

% Extract Steady-State of Decimated Output (Last 80%)
start_idx = floor(N_dec * 0.2); 
v_clean = HBF2out(start_idx:end);
v_clean_ac = v_clean - mean(v_clean); % DC Removal
N_steady = length(v_clean_ac);

% Calculate PSD for Decimated Output
w_dec = hann(N_steady);
norm_dec = sum(w_dec);
X_dec = abs(fft(v_clean_ac .* w_dec(:)));
X_mag_dec = X_dec(1:floor(N_steady/2)) * 2 / norm_dec;
X_db_dec = 20*log10(X_mag_dec + eps);
f_dec_axis = (0:floor(N_steady/2)-1) * (fs_dec / N_steady);

% Plotting
figure('Color', 'w', 'Name', 'Final PSD Comparison');
hold on;

%Original DSM
p1 = plot(f_axis/1e3, X_db, 'b', 'LineWidth', 1);
%Decimated Output
p2 = plot(f_dec_axis/1e3, X_db_dec, 'r', 'LineWidth', 2);
lx = xline(fx/1e3, '--g', 'LineWidth', 1.5);
lb = xline(fB/1e3, '--k', 'LineWidth', 2);

legend([p1, p2, lx, lb], ...
    {'DSM Bitstream', ...
     'Decimated Output', ...
     'Input Signal Frequency', ...
     'Signal Bandwidth (fB)'}, ...
    'Location', 'southeast', 'FontSize', 9);
grid on;
set(gca, 'XScale', 'log'); 
xlim([0.1 fs/2e3]); 
ylim([-160 10]);
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');
title(['PSD Comparison (SNR: ' num2str(SNR_dB, '%.2f') ' dB)']);
hold off;