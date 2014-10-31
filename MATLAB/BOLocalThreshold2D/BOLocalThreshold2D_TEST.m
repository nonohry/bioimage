%% Clear ALL
clc; clear all; close all;
%% Load Image
im = imread('./images/text.tif');
%% Local Threshold
n = 45; c = 0;
th1 = BOMeanThreshold2D(im,n,c);
c = 0;
th2 = BOMedianThreshold2D(im,n,c);
c = 0;
th3 = BOMidGreyThreshold2D(im,n,c);
k = -0.2;
th4 = BONiblackThreshold2D(im,n,k);
c = n;
th5 = BOBernsenThreshold2D(im,n,c);
k = 0.5; R = 128;
th6 = BOSauvolaThreshold2D(im,n,k,R);
%% Plot
figure,
imagesc(im); title('Input')
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
%%
figure,
subplot(2,3,1), imagesc(th1); title('Mean')
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(2,3,2), imagesc(th2); title('Median')
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(2,3,3), imagesc(th3); title('MidGrey')
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(2,3,4), imagesc(th4); title('Niblack')
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(2,3,5), imagesc(th5); title('Bernsen')
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
subplot(2,3,6), imagesc(th6); title('Sauvola')
colormap gray; set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
