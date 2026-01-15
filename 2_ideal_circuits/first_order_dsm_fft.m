%% Init
clc;
clearvars;
close all;

%% =======================
% SIMULATION PARAMETERS
%% =======================
fs = 1e6;               % Sampling frequency
Ts = 1/fs;
M  = 500;               % OSR
N  = 16 * M;              % Number of samples
cycles = 5;            % Integer cycles (USED AS-IS)
A  = 0.8;               % Input amplitude
fx = cycles*fs/N;       % Input frequency

Vref = 3;
Vcm  = Vref/2;
fB   = fs/(2*M);

SamplingFrequency = fs;
OLgain = 1000;
a = 1;
b = [1 1];
c = 1;

%% =======================
% LOAD SIMULINK MODEL
%% =======================
modelDir = fullfile(fileparts(pwd), '1_behavioural_model');
addpath(modelDir);
modelName = 'dsm_l1_sim';

if bdIsLoaded(modelName)
    close_system(modelName, 0);   % close WITHOUT saving
end

load_system(modelName);

sineBlock = find_system(modelName, 'BlockType', 'Sin');
if ~isempty(sineBlock)
    set_param(sineBlock{1}, 'Frequency', num2str(2*pi*fx));
    set_param(sineBlock{1}, 'SampleTime', num2str(Ts));
    set_param(sineBlock{1}, 'Amplitude', num2str(A));
end

filterBlock = find_system(modelName, 'BlockType', 'DiscreteFilter');
if ~isempty(filterBlock)
    set_param(filterBlock{1}, 'SampleTime', num2str(Ts));
end

%% =======================
% RUN BEHAVIORAL SIMULATION
%% =======================
fprintf('Running Behavioral Simulation...\n');

T_stop = (N-1)*Ts;
in = Simulink.SimulationInput(modelName);
in = in.setVariable('OLgain', OLgain);
in = in.setVariable('a', a);
in = in.setVariable('b', b);
in = in.setVariable('c', c);
in = in.setVariable('SamplingFrequency', fs);
in = in.setModelParameter('StopTime', num2str(T_stop));

simOut = sim(in);
logs = simOut.logsout;

dsm = squeeze(logs.getElement('dsmLog').Values.Data);
dsm = dsm(1:N);

%% =======================
% LOAD CIRCUIT DATA
%% =======================
fprintf('Processing Circuit Data...\n');

filename = fullfile('simulations', 'dsm_data.txt');
if ~isfile(filename)
    warning('Circuit data not found.');
    dsm_circuit = [];
else
    data = readmatrix(filename);

    t_raw = data(:,5);
    v_raw = data(:,6);

    [t_unique, idx] = unique(t_raw);
    v_unique = v_raw(idx);

    t_start = 1e-3;  % settling
    t_uniform = t_start + (0:N-1)'*Ts;

    v_interp = interp1(t_unique, v_unique, t_uniform, 'nearest', 'extrap');

    % Comparator → ±1 (MATCH Simulink)
    dsm_circuit = double(v_interp > Vcm);
    dsm_circuit(dsm_circuit == 0) = -1;

    % Remove DC
    dsm_circuit = dsm_circuit - mean(dsm_circuit);
end

%% =======================
% TIME DOMAIN COMPARISON
%% =======================
figure('Name','DSM Time Domain Comparison');
stairs(dsm(1:200),'b','LineWidth',1.5); hold on;
if ~isempty(dsm_circuit)
    stairs(dsm_circuit(1:200),'r--','LineWidth',1.5);
end
grid on;
xlabel('Sample Index');
ylabel('Amplitude');
legend('Behavioral','Circuit');
title('DSM Output (First 200 Samples)');

%% =======================
% FFT & SNR (BEHAVIORAL)
%% =======================
w = hann(N);
norm_factor = sum(w);

Nfft = floor(N/2);

dsm_w = dsm .* w;
X = abs(fft(dsm_w));
X_mag = X(1:Nfft)*2/norm_factor;
X_db  = 20*log10(X_mag + eps);

bin_sig = 1 + cycles;
bin_bw  = floor(fB*N/fs);

span = 1;
sig_idx = (bin_sig-span):(bin_sig+span);
noise_idx = 2:bin_bw;
noise_idx = setdiff(noise_idx, sig_idx);

P_sig = sum(X_mag(sig_idx).^2);
P_noise = sum(X_mag(noise_idx).^2);
SNR_dB = 10*log10(P_sig/P_noise);

fprintf('\n--- BEHAVIORAL RESULTS ---\n');
fprintf('Signal Power: %.2f dB\n',10*log10(P_sig));
fprintf('Noise Power:  %.2f dB\n',10*log10(P_noise));
fprintf('SNR:          %.2f dB\n',SNR_dB);

%% =======================
% FFT & SNR (CIRCUIT)
%% =======================
if ~isempty(dsm_circuit)

    dsmc_w = dsm_circuit .* w;
    Xc = abs(fft(dsmc_w));
    Xc_mag = Xc(1:Nfft)*2/norm_factor;
    Xc_db  = 20*log10(Xc_mag + eps);

    P_sig_c = sum(Xc_mag(sig_idx).^2);
    P_noise_c = sum(Xc_mag(noise_idx).^2);
    SNR_c_dB = 10*log10(P_sig_c/P_noise_c);

    fprintf('\n--- CIRCUIT RESULTS ---\n');
    fprintf('Signal Power: %.2f dB\n',10*log10(P_sig_c));
    fprintf('Noise Power:  %.2f dB\n',10*log10(P_noise_c));
    fprintf('SNR:          %.2f dB\n',SNR_c_dB);
end

%% =======================
% PSD COMPARISON PLOT
%% =======================
f_axis = (0:Nfft-1)*(fs/N);

figure('Name','DSM PSD Comparison');
semilogx(f_axis, X_db, 'b','LineWidth',1.5,...
    'DisplayName',sprintf('Behavioral (SNR %.1f dB)',SNR_dB));
hold on;

if ~isempty(dsm_circuit)
    semilogx(f_axis, Xc_db, 'r','LineWidth',1.5,...
        'DisplayName',sprintf('Circuit (SNR %.1f dB)',SNR_c_dB));
end

xline(fB,'--y','LineWidth',2,'Label','Bandwidth');
xline(fx,'--g','LineWidth',1.5,'Label','Signal');
grid on;
xlim([f_axis(2) fs/2]);
ylim([-160 10]);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title(['DSM PSD Comparison (OSR = ' num2str(M) ')']);
legend('show','Location','southwest');
