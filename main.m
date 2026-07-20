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
%% 选择需要分析的实际通道号

% analysis_channel_nos = 3225:3323;  % 阀门1跳线
% analysis_channel_nos = 3269:3285;
analysis_channel_nos = 3211:3225;  % 阀门1附近轴向跳线

% % analysis_channel_nos = 3580:3703;  % 阀门2跳线  % % analysis_channel_nos = 3661:3669;  % 阀门2跳线
% analysis_channel_nos = 2750:2780;  % 阀门2增敏线缠绕主管
% analysis_channel_nos = 2723:2750;  % 阀门2缠绕阀门增敏线
% analysis_channel_nos = 2780:2787;  % 阀门2轴向增敏线


% analysis_channel_nos = 3081:3211;   % 泄露口1
% analysis_channel_nos = 3107:3118;   % 泄露口1
% analysis_channel_nos = 3073:3081;  % 泄露口1附近轴向跳线

% analysis_channel_nos = 2841:2959;   % 泄露口3
% analysis_channel_nos = 2897:2912;   % 泄露口3
% analysis_channel_nos = 2832:2841;   % 泄露口3轴向
% analysis_channel_nos = [2750, 2752, 2760, 2785];
% analysis_channel_nos = StartChanelNo + (0:size(signal_leak, 2) - 1);

% analysis_channel_nos = 3969:3997;   % 阀门井1轴向迂回
% analysis_channel_nos = 3639:3665;   % 阀门井2轴向迂回

% analysis_channel_nos = 2812:2832;   % 泄露口4
% analysis_channel_nos = 2797:2812;   % 泄露口4轴向

% analysis_channel_nos = 2780:2787;   % 立杆轴向

% 将实际通道号映射为信号矩阵列索引：
% column_index = actual_channel_no - StartChanelNo + 1
analysis_col_indices = analysis_channel_nos - StartChanelNo + 1;
if any(analysis_col_indices < 1) || ...
        any(analysis_col_indices > size(signal_leak, 2)) || ...
        any(analysis_col_indices > size(signal_bg, 2))
    error('mainfunction:AnalysisChannelOutOfRange', ...
        'analysis_channel_nos 超出原始泄漏或背景信号的通道范围。');
end
signal_leak_analysis = signal_leak( : , analysis_col_indices);
signal_bg_analysis = signal_bg( :  , analysis_col_indices);
