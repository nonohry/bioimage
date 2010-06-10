%% Clear ALL
clc; clear all; close all;
%% Setup
s = 10; dir = 12;
%% Plot 
for i=1:dir
    a = 2*pi*(i-1)/dir;
    hG = BOhGFilter2D(s,a);
    figure, surfc(hG);
end