%% Clear ALL
clc; clear all; close all;
%% Construct test image
im = zeros(201,201);
%% |
%im(100,:) = 1;
%% X
im(100,:) = 1; im(:,100) = 1;
%% L
% im(100,1:100) = 1; im(1:100,100) = 1;
%% '
%im(1:100,100) = 1;
%% T
%im(100,:) = 1; im(1:100,100) = 1;
%% Desing steerable filters
sigma = 1; order = 4; ndir = 24; theta = 0:pi/ndir:pi-pi/ndir;
[G,H] = BOSteerableFilters2D(sigma,theta,order);
%% Orientation analysis using Steerable Filters
imE = BOSteerableFiltersOrientedEnergy(im,G,H);
%% Plot image
figure;
subplot(1,3,1); imagesc(im);  colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
%% Plot signal
signal = squeeze(imE(100,100,:))'; 
signal = [signal signal signal(1)];
angle = [theta theta+pi 2*pi];
subplot(1,3,2); plot(angle,signal); 
set(gca,'yticklabel',[]); set(gca,'xticklabel',[]); axis square; xlim([0 2*pi]);
%% Plot polar
subplot(1,3,3); polar(angle,signal); delete(findall(gcf,'type','text'));
