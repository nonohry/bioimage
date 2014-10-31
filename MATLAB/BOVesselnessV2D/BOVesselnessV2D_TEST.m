%% Clear ALL
clc; clear all; close all;
%% Path - Libs
addpath('../BOVesselness2D/');
%% Load Image
im = imread ('./images/jellyfish.tif');
%% Calculate Vesselness
sigma = 0.2:0.5:5; gamma = 2; beta = 0.5; c = 15; wb = true;
[V,Vmax,Vidx,Vx,Vy] = BOVesselnessV2D(im,sigma,gamma,beta,c,wb);
%% Plot
figure;
subplot(1,2,1), imagesc(im);
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(1,2,2), imagesc(Vmax);
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
%%
figure;
[X,Y] = meshgrid(1:size(im,2),1:size(im,1));
imagesc(Vmax); hold on; quiver(X,Y,Vmax.*Vy,Vmax.*Vx,'r');
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
set(gca,'xlim',[250 280]); set(gca,'ylim',[220 250])