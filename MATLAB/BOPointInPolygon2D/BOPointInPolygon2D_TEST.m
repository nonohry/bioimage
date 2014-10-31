%% Clear All
clc; clear all; close all;
%% Create a polygon
t = 0:0.6:6.28;
seedx = 100; seedy = 100;
scalefactor = 20; P = [];
P(:,1) = (seedx(1) + scalefactor*cos(t))';
P(:,2) = (seedy(1) + scalefactor*sin(t))';
P = [P; P(1,:)];
%% Plot
plot(P(:,1),P(:,2),'-ms'); hold on
title('STOP: right button; LEGEND: gx-border, r*-inside, bo-outside');
%% Query
button = 1;
while button==1
    [x,y,button] = ginput(1);    
    q = [x y];
    stage = BOPointInPolygon2D(P,[x y]);
    if strcmp(stage,'e')
        plot(x,y,'gx'); hold on;
    elseif strcmp(stage,'i')
        plot(x,y,'r*'); hold on;
    elseif strcmp(stage,'o')
        plot(x,y,'bo'); hold on;
    end
end