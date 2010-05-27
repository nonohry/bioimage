%% Clear ALL
clc; clear all; close all;
%% Test
x1 = [0 0]; x2 = [1 0]; x3 = [0 0]; 
for t=0:0.1:2*pi
    y = sin(t); x = cos(t); x4 = [x y];
    plot([x1(1) x2(1)],[x1(2) x2(2)],'b-'); hold on;
    plot([x3(1) x4(1)],[x3(2) x4(2)],'r-'); hold on;
    xlim([-3 3]); ylim([-3 3]); grid on; %axis equal; 
    v1 = x2-x1; v2 = x4-x3;
    %title(['Angle: ' num2str(BOVectorVectorAngle2D(v1,v2,0,1))])
    title(['Angle: ' num2str(atan2(v2,v1))])
    pause(0.2);
    hold off;
end