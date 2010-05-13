%% Clear ALL
clc; clear all; close all;
%% Read image
im = imread('./images/triple.tif');
im = im<10;
%% Skeleton
im = bwmorph(im, 'thin', inf);
%% Hit or Miss
out1 = BOHitOrMiss2D(im, 'end');
out2 = BOHitOrMiss2D(im, 'triple');
%% Plot
ims = im;
ims = ims + 2*out1;
ims = ims + 8*out2;
imagesc(ims);