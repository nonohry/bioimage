%% Clear ALL
clc; clear all; close all;
%% Add path
addpath('../BOHitOrMissE2D/');
%% Load image
im = imread('./images/triple.tif');
im = im<10;
%% Skeleton
im = bwmorph(im, 'thin', inf);
%% Pruning
out = BOPruning2D(im,3);
%% Plot
ims = im;
ims = ims + 2*out;
imagesc(imcomplement(ims)); colormap gray;
set(gca,'xtick',[]);set(gca,'ytick',[]); axis equal; axis tight;