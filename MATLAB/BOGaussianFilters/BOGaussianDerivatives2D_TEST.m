%% Clear ALL
clc; clear all; close all;
%% Derivatives
s = 5;
[G,Gx,Gy,Gxx,Gyy,Gxy,Gyx] = BOGaussianDerivatives2D(s);
%% Plot
figure; surfc(G);
figure; surfc(Gx);
figure; surfc(Gy);
figure; surfc(Gxx);
figure; surfc(Gyy);
figure; surfc(Gxy);
figure; surfc(Gyx);