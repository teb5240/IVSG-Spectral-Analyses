clc
close all
clear

%% Read in EEG g.Nautilus data from Andrew's systems
cd 'C:\Users\tbaum\OneDrive\Documents\Research\BCI Files\Andrew_MI_frontshift_chair001';
filename = 'Andrew_MI_frontshift_chairS001R01.dat';

[data_eeg,B,C,D] = load_bcidat(filename,'-calibrated');
acceleration_x = B.AccelerationX1;
acceleration_y = B.AccelerationY1;
acceleration_z = B.AccelerationZ1;
stimulus = B.TargetCode;
params.Fs = 250;

%% Filter EEG data
number_of_channels = size(data_eeg,2);
channels = {'Cz', 'Fz', 'P3', 'Pz', 'P4', 'PO7', 'PO8', 'Oz'}; % Channels from 9/11 AndrewBCI2000_gNautilus_MI_wheelchairS001R03.dat

%% Get mu data
[bb, aa] = butter(4,[8 12]/(params.Fs/2),'bandpass');
mu = filtfilt(bb,aa,data_eeg);

%% Spectra for Various Times

figure(2)

for i = 1:8
    data = mu(:,i);
    movingwin = [1 .5]; %[winsize winstep]
    params.tapers = [5 9]; %[timeBandwidthProduct numOfTapers]

    [S1, t1, f1] = mtspecgramc(data, movingwin, params);

    % plot spectrogram
    subplot(8, 1, i)
    plot_matrix(S1,t1,f1);
    ylim([0 40]) % set y-limits
    xlabel('Time(sec)', 'fontsize',5);
    ylabel('Frequency (Hz)', 'fontsize',5);
    caxis([-25 18]);
    set(gca,'FontSize',5)
    map = jet;
    colormap(map)
    str = channels(i);
    title(str, 'fontsize',5)
    hold on
    time = (1/params.Fs)*(1:length(data_eeg));
    plot(time, stimulus*10)
end

figure(1)

for i = 1:8
    data = data_eeg(:,i);
    movingwin = [1 .5]; %[winsize winstep]
    params.tapers = [5 9]; %[timeBandwidthProduct numOfTapers]

    [S1, t1, f1] = mtspecgramc(data, movingwin, params);

    % plot spectrogram
    subplot(8, 1, i)
    plot_matrix(S1,t1,f1);
    ylim([0 40]) % set y-limits
    xlabel('Time(sec)', 'fontsize',5);
    ylabel('Frequency (Hz)', 'fontsize',5);
    caxis([-25 18]);
    map = jet;
    colormap(map)
    str = channels(i);
    title(str, 'fontsize',5)
    set(gca,'FontSize',5)
    hold on
    time = (1/params.Fs)*(1:length(data_eeg));
    plot(time, stimulus*10)
end

