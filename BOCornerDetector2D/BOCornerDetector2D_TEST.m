%% Clear ALL
clc; clear all; close all;
%% Read image
im = imread('./images/corner.tif');
%% Detect corners
imcorner1 = BOCornerDetector2D(im,4,6);
im = ~im;
imcorner2 = BOCornerDetector2D(im,4,6);
immax = max(imcorner1, imcorner2);
%% Plot
implot = max(double(~im),2*double(immax)); imagesc(implot);