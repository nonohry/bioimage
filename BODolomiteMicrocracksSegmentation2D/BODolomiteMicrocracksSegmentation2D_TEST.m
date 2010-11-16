%% Clear ALL
clc; clear all; close all;
%% Load image
for i=1:2
   ims(:,:,:,i) = imread(['./images/image' num2str(i+11) '.tif']);
end
%% Microcracks Segmentation
ndir = 12; s1 = 12; s2 = 2;
[imth,imtmax] = BODolomiteMicrocracksSegmentation2D(ims,ndir,s1,s2);
%% Plot
figure; imagesc(imtmax); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
figure; imagesc(imth); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;