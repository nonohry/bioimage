%% Clear ALL
clc; clear all; close all;
%% Setup
s = 10; l = 50; dir = 12;
%% Plot 
for i=1:dir
    a = 2*pi*(i-1)/dir;
    sG = BOsGFilter2D(s,l,a);
    figure, surfc(sG);
end