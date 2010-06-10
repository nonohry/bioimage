%% Clear ALL
clc; clear all; close all;
%% Setup
s = 5; s2 = 10;
%% 1D LoG
LoG1D = BOLoGFilter1D(s);
figure; plot(LoG1D);
%% 2D LoG
LoG2D = BOLoGFilter2D(s);
figure; surfc(LoG2D);
%% 1D DoG
DoG1D = BODoGFilter1D(s,s2);
figure; plot(DoG1D);
%% 2D LoG
DoG2D = BODoGFilter2D(s,s2);
figure; surfc(DoG2D);