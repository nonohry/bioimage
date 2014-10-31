%% Clear ALL
clc; clear all; close all;
%% Load Image
im = imread ('./images/jellyfish.tif');
%% Calculate Vesselness
sigma = 0.2:0.5:5; gamma = 2; beta = 0.5; c = 15; wb = true;
[V,Vmax] = BOVesselness2D(im,sigma,gamma,beta,c,wb);
%% Plot
figure;
subplot(1,2,1), imagesc(im);
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(1,2,2), imagesc(Vmax);
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;