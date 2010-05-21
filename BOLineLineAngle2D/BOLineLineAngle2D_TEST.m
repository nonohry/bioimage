%% Clear ALL
clc; clear all; close all;
%% Test
x1 = [-1 0]; x2 = [1 0]; 
for t=0:0.1:2*pi
    y = sin(t); x = cos(t);
    x3 = [x y];
    y = sin(t+pi); x = cos(t+pi);
    x4 = [x y];
    plot([x1(1) x2(1)],[x1(2) x2(2)],'b-'); hold on;
    plot([x3(1) x4(1)],[x3(2) x4(2)],'r-'); hold on;
    plot(x1(1),x1(2),'b.'); hold on;
    plot(x2(1),x2(2),'b>'); hold on;
    plot(x3(1),x3(2),'r.'); hold on;
    plot(x4(1),x4(2),'b>'); hold on;
    xlim([-3 3]); ylim([-3 3]); grid on;
    title(['Angle: ' num2str(BOLineLineAngle2D(x1,x2,x3,x4,0,1))])
    pause(0.2);
    hold off;
end