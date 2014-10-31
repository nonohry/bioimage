%% Clear ALL
clc; clear all; close all;
%% Read image
im = imread('./images/granulometry.tif');
%% Calculate its granulometry
B = 1;
[E,H,A,p,N] = BOGranulometry2D(im,B);
%% Plot
figure; imagesc(im); colormap gray;
set(gca,'xtick',[]); set(gca,'ytick',[]); axis equal; axis tight;
figure; plot(0:N,A,'r-o');
title(['Granulometry: Size Mean = ' num2str(E) ' and Size Entropy = ' num2str(H)]);
xlabel('Size'); ylabel('Size Distribution Function');