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
imrgb = zeros(size(im,1),size(im,2),3);
imrgb(:,:,1) = im;
imrgb(:,:,2) = im;
imrgb(:,:,3) = im;
imrgb(:,:,1) = max(imrgb(:,:,1),double(immax));
imagesc(imrgb);