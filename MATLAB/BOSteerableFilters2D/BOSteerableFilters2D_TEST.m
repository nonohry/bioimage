%% Clear ALL
clc; clear all; close all;
%% Desing steerable filters
sigma = 10; order = 4; theta = [0 pi/4 pi/2];
[G,H] = BOSteerableFilters2D(sigma,theta,order);
%% Plot
G0 = imrotate(G(:,:,1),-90);
H0 = imrotate(H(:,:,1),-90);
G45 = imrotate(G(:,:,2),-90);
H45 = imrotate(H(:,:,2),-90);
G90 = imrotate(G(:,:,3),-90);
H90 = imrotate(H(:,:,3),-90);
figure('Name','Steerable Filters'); 
subplot(3,2,1); imagesc(G0);  colormap gray; title('G0'); 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(3,2,2); imagesc(H0);  colormap gray; title('H0');
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(3,2,3); imagesc(G45);  colormap gray; title('G45'); 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(3,2,4); imagesc(H45);  colormap gray; title('H45');
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(3,2,5); imagesc(G90);  colormap gray; title('G90'); 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(3,2,6); imagesc(H90);  colormap gray; title('H90');
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;