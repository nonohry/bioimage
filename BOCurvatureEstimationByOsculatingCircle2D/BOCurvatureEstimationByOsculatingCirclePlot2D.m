function BOCurvatureEstimationByOsculatingCirclePlot2D(C,radius,center)
for i=1:length(radius)
    plot(center(i,1),center(i,2),'r.'); hold on;
    theta = linspace(0,2*pi,1000);
    rho = ones(1,1000)*radius(i);
    [x,y] = pol2cart(theta,rho);
    x = x + center(i,1);
    y = y + center(i,2);
    plot(x,y,'r-'); hold on;
end
plot(C(:,1),C(:,2),'b-','LineWidth',2); hold on;
end