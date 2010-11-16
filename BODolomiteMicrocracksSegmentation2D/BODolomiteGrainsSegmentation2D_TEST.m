%% Clear ALL
clc; clear all; close all;
%% Load image
for i=1:11
   ims(:,:,:,i) = imread(['./images/image' num2str(i) '.tif']);
end
%% Grains segmentation
s = 8;
[imth,imvmax] = BODolomiteGrainsSegmentation2D(ims,s);
%% Plot
figure; imagesc(imvmax); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
figure; imagesc(imth); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;