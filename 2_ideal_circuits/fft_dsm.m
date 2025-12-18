clc; clearvars; close all;

filename = fullfile('simulations', 'dsm_data.txt'); 

if ~isfile(filename)
    error('File not found! Make sure "dsm_output.txt" is inside the "simulations" folder.');
end

% --- PARAMETERS ---
Fs = 1e6;         % Sampling Freq = 1 MHz
Fin = 1e3;        % Input Freq = 1 kHz
OSR = 64;         % Oversampling Ratio

% Import Data
data = readmatrix(filename);
t_raw = data(:, 5);
v_raw = data(:, 6);

% --- Remove Duplicate Time Points ---
[t_unique, unique_idx] = unique(t_raw); 
v_unique = v_raw(unique_idx);

Ts = 1/Fs;

% We skip the first 1ms (1000 samples) to let the loop settle.
startup_delay = 1e-3; 
start_time = max(0.9*Ts, min(t_unique));

if start_time < startup_delay
    start_time = startup_delay;
end

t_clk = start_time : Ts : (max(t_unique)); 

% Interpolate
v_sampled_analog = interp1(t_unique, v_unique, t_clk, 'nearest');
v = (v_sampled_analog > 1.5) * 2 - 1; 
N = length(v); 

% Hann window to fix leakage and sum noise ONLY in-band.

% Create Window
w = hann(N)'; 
v_windowed = v .* w;

% FFT with Window Normalization
sq = abs(fft(v_windowed));
norm_factor = sum(w) / 2; % Normalize for single-sided amplitude

% Single-Sided Spectrum
sq_hlf = sq(1:floor(N/2)) / norm_factor; 

% Convert to dBFS
sqdBFS = 20*log10(sq_hlf);
sqdBFS(isinf(sqdBFS)) = -150; 

% --- SNR Calculation (In-Band Only) ---
Bandwidth = Fs / (2 * OSR); 

target_bin = round((Fin/Fs) * N) + 1;
bw_bin = floor((Bandwidth/Fs) * N) + 1;

signal_power = sq_hlf(target_bin)^2;

%    Noise Power (In-Band)
%    From Bin 2 (skip DC) up to Bandwidth Bin, EXCLUDING the signal
span = 2; % Skip 2 bins around signal to avoid leakage power
in_band_bins = 2:bw_bin;
signal_region = (target_bin-span):(target_bin+span);

% Remove signal indices from the noise list
noise_indices = setdiff(in_band_bins, signal_region);

% Sum noise ONLY in the baseband
noise_power = sum(sq_hlf(noise_indices).^2);

snr = 10*log10(signal_power / noise_power);

fprintf('------------------------------------------\n');
fprintf('Final Analysis Results:\n');
fprintf('------------------------------------------\n');
fprintf('Number of Samples (N): %d\n', N);
fprintf('Signal Detected at:    %.2f Hz\n', (target_bin-1)*Fs/N);
fprintf('In-Band Limit:         %.2f Hz (Bin %d)\n', Bandwidth, bw_bin);
fprintf('Calculated SNR:        %.2f dB\n', snr);
fprintf('ENOB:                  %.2f bits\n', (snr-1.76)/6.02);
fprintf('------------------------------------------\n');

fig4 = figure(4);
set(gca, 'fontsize', 14);

% Frequency Axis
f_axis = (0:N/2-1) * (Fs/N);

semilogx(f_axis, sqdBFS, 'LineWidth', 1);

xlabel('Frequency (Hz)');
ylabel('DFT Magnitude in dBFS');
title(['FFT (SNR = ' num2str(snr, '%.1f') ' dB, ENOB = ' num2str((snr-1.76)/6.02, '%.1f') ')']);
grid on;
xlim([100 Fs/2]); 
ylim([-150 10]);

hold on;
xline(Fin, '--g', 'Input Tone');
xline(Bandwidth, '--r', 'Bandwidth Limit', 'LabelVerticalAlignment', 'bottom');
legend('Spectrum', 'Input Signal', 'Noise Integration Limit');