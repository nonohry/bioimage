%% Clear ALL
clc; clear all; close all;
%% Load image
load 'mat/arabidopsis.mat'
imageNuclei = double(imageNuclei)/double(max(imageNuclei(:)));  
imageMembrane = double(imageMembrane)/double(max(imageMembrane(:)));
%% Nuclei detection
nucleiSize = 2.4; thValue = 0.3; 
nucleiPositions = ...
    BONucleiDetector2D(imageNuclei,imageMembrane,...
                        nucleiSize,thValue,resolutionXY);
%% Plot
figure,imshow(imageNuclei), colormap gray; hold on;
for i=1:size(nucleiPositions,1)
    plot(nucleiPositions(i,2),nucleiPositions(i,1),'.y'); hold on;
end