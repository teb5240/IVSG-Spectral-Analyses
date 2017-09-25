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

%% Filter EEG data
number_of_channels = size(data_eeg,2);
channels = {'Cz', 'Fz', 'P3', 'Pz', 'P4', 'PO7', 'PO8', 'Oz'}; % Channels from 9/11 AndrewBCI2000_gNautilus_MI_wheelchairS001R03.dat

%% Plot Filtered Data

