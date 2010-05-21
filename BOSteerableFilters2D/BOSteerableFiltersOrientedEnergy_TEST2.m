%% Clear ALL
clc; clear all; close all;
%% Load image
im = imread('./images/intersections.tif');
%% Normalize
im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:)));
%% Desing steerable filters
sigma = 5; order = 4; ndir = 12; theta = 0:pi/ndir:pi-pi/ndir;
[G,H] = BOSteerableFilters2D(sigma,theta,order);
%% Orientation analysis using Steerable Filters
imE = BOSteerableFiltersOrientedEnergy(im,G,H);
%% Average of oriented energy
imEa = zeros(size(im));
for i=1:size(G,3)
    imEa = imadd(imEa,imE(:,:,i));
end
imEa = imEa/size(G,3);
%% Plot average of oriented energy
figure; 
subplot(1,2,1); imagesc(im);  colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(1,2,2); imagesc(imEa);  colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;