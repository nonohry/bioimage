%% Clear ALL
clc; clear all; close all;
%% Add path
addpath('../BOCurveSegmentation2D/');
%% Load image
im = imread('./images/wave.tif');
%% Contour
[row, col] = find(im,1);
C = bwtraceboundary(im, [row, col], 'N');
[K,c] = BOCurvatureEstimationByOsculatingCircle2D(C);
%% Plot
BOCurvatureEstimationByOsculatingCirclePlot2D(C,K.^-1,c)
%% Mean and variance
mK = mean(K); vK = var(K);
disp(['Cuvature: ' sprintf('%f %f', [mK vK])]);