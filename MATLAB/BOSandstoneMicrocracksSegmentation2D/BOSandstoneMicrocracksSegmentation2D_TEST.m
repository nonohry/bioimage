%% Clear
clc; clear all; close all;
%% Load image
imrgb = imread('./images/sandstone.tif');
%% RGB -> G
im = imrgb(:,:,2);
%% Normalize
im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:))); 
%% Segmentation
s1 = 10; s2 = 10; nr = 12;
imsk = BOSandstoneMicrocracksSegmentation2D(im,s1,s2,nr);
%% Plot
figure, imagesc(imrgb);
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
%% Plot
[B,L] = bwboundaries(imsk);
figure, imagesc(imrgb); hold on;
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2),boundary(:,1),'w','LineWidth',1)
end
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;