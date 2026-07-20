tic;
clear;
clc;
close all;

config = struct();
config.FolderPath = 'E:\02有压管道\楼下埋地水管\0717';
% config.FolderPath = 'E:\02有压管道\楼下埋地水管\0630覆土';
files = dir(fullfile(config.FolderPath, '*.dat'));