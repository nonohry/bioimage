%% Clear ALL
clc; clear all; close all;
%% Load image
im = imread('./images/microtubules.tif');
%% Plot
figure; imagesc(im); colormap gray; hold on;
set(gca,'ytick',[]); set(gca,'xtick',[]); axis equal; axis tight;
title('Select 2 points: start and the end of the profile line ...');
%% Select profile
[x,y] = ginput(2);
xline = [x(1), x(2)]; yline = [y(1), y(2)];
yp = improfile(im,xline,yline);
xp = (1:length(yp))';
%% Plot profile line
h = imline(gca,[x(1) x(2)], [y(1) y(2)]); setColor(h,[0 1 0]);
%% Calculate profile line parameters
[a1,a2,a3,a4,cfun] = BOCurvilinearStructureProfileParameters2D(xp,yp);
%% Calculate estimated profile coordinaties
ypfit = feval(cfun,xp);
%% Plot
figure; plot(xp,yp,'r*'); hold on; plot(xp,ypfit,'b-'); hold on;
%% Print parameters
param(1) = {['[a1,a2,a3,a4]: [' num2str(a1) ',' num2str(a2) ',' ...
                                num2str(a3) ',' num2str(a4) ']']};
param(2) = {'a1 - the amplitude of the Gaussian function'};
param(3) = {'a2 - the peak position of the curve along x-axis'};
param(4) = {'a3 - the spread of the Gaussian curve'};
param(5) = {'a4 - the grey level of the background'};
xl = get(gca,'xlim'); yl = get(gca,'ylim');
text(xl(1)+10,yl(2)-20,param);
% disp(['[a1,a2,a3,a4]: [' num2str(a1) ',' num2str(a2) ',' ...
%                          num2str(a3) ',' num2str(a4) ']']);
% disp('a1 - the amplitude of the Gaussian function');
% disp('a2 - the peak position of the curve along x-axis');
% disp('a3 - the spread of the Gaussian curve');
% disp('a4 - the grey level of the background');