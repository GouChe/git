tic;
clear;
clc;
close all;

config = struct();
config.FolderPath = 'E:\02有压管道\楼下埋地水管\0717';
% config.FolderPath = 'E:\02有压管道\楼下埋地水管\0630覆土';
files = dir(fullfile(config.FolderPath, '*.dat'));
%% 读取文件

i_file = 74;    % 85~81
[signal_leak, fs, StartChanelNo, d] = readDatFile(files(i_file), config.FolderPath);
% Data_plot_waterfall(signal_leak( 4*fs: 9*fs,   :  ), fs, StartChanelNo);
i_file = 70;
[signal_bg, ~, ~, ~] = readDatFile(files(i_file), config.FolderPath);