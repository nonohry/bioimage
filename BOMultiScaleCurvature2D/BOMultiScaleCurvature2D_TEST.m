%% Clear ALL
clc; clear all; close all;
%% Load image
im = imread('./images/panda.tif');
%% Calculate multi-scale curvature
sigmastart = 1; sigmadelta = 0.1;
[K,S,X,Y,Xsm,Ysm,zcp] = BOMultiScaleCurvature2D(im,sigmastart,sigmadelta);
%% Plot
p = 0.1;
BOMultiScaleCurvaturePlot2D(K,S,X,Y,Xsm,Ysm,zcp,p);