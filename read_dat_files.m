clc
close all
clear

%%% Read in EEG g.Nautilus data from Andrew's systems
cd 'C:\Users\tbaum\OneDrive\Documents\Research\BCI Files\Andrew_MI_frontshift_chair001';
filename = 'Andrew_MI_frontshift_chairS001R01.dat';
% filepath = dir([foldername '/*' filename]);
[data_eeg,B,C,D] = load_bcidat(filename,'-calibrated');
acceleration_x = B.AccelerationX1;
acceleration_y = B.AccelerationY1;
acceleration_z = B.AccelerationZ1;
stimulus = B.TargetCode;