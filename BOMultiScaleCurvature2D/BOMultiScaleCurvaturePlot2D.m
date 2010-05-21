function BOMultiScaleCurvaturePlot2D(K,S,X,Y,Xsm,Ysm,zcp,p)
%%  BOMultiScaleCurvaturePlot2D - plots curvature scale-space image
%   
%   REFERENCE:
%       Farzin Mokhtarian and Alan Mackworth,
%       Scale-based description and recognition of planar curves and 
%       two-dimensional shapes,
%       IEEE Transactions on Pattern Analysis and Machine Intelligence,
%       1, 34-43, 1986.
%   
%   HELP:                                       
%
%   INPUT:
%       K           - curvatures calculated for each sigma
%       S           - sigmas
%       X           - x coor of contour
%       Y           - y coor of contour
%       Xsm         - x coor of contour convolved with Gaussian
%       Ysm         - x coor of contour convolved with Gaussian
%       zcp         - indexes of zero-crossing points
%       p           - pause
%
%   OUTPUT:
%       out     - image with detected points
%       zcp     - zero-crossing points
%
%   USAGE:
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 30/06/2009 First implementation

%% Plot
figure, 
for i=1:length(zcp)
    Xs = Xsm{i};
    Ys = Ysm{i};
    zc = zcp{i};
    plot(X,Y,'b-');
    hold on;
    plot(Xs,Ys,'r-');
    hold on;
    plot(Xs(zc),Ys(zc),'go');
    pause(p);
    hold off
end
plot(X,Y,'b-');
%%
figure,
for i=1:length(zcp)
    plot(zcp{i},S{i},'k.');%,'MarkerFaceColor',C(i,:),'MarkerEdgeColor',C(i,:));
    hold on
end
hold off    
xlim([1 length(K{1})]);
%% End
end