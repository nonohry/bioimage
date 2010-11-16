%% Clear ALL
clc; clear all; close all;
%% Load image
im = imread('./images/brain.tif');
%% Fetal Brain Vessels Segmentation
s = 15;
th = BOFetalBrainVesselsSegmentation2D(im,s);
%% Plot
figure; image(im); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
[B,L] = bwboundaries(th);
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1)
end