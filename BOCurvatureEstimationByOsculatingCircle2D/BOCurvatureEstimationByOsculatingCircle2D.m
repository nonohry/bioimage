function [K,c] = BOCurvatureEstimationByOsculatingCircle2D(C) 
%% BOCurvatureEstimationByOsculatingCircle2D - 
%           curve estimation by osculating circle
%   
%   REFERENCE:
%       Simon Hermann and Reinhard Klette,
%       A Comparative Study on 2D Curvature Estimators,
%       International Conference on Computing: Theory and
%       Applications,584-589,2007
%       (Algorithm 2)
%
%   INPUT:
%       C     - contour as C = [y,x].
%
%   OUTPUT:
%       K     - curvature = 1/r,
%       c     - circle center.
%
%   USAGE:
%       % Contour
%       [row,col] = find(im,1);
%       C = bwtraceboundary(im,[row,col],'N');
%       % Curvature estimation
%       [K,c] = BOCurvatureEstimationByOsculatingCircle2D(C)
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 23/09/2008 First implementation

%%
K = []; c = [];
S = BOCurveSegmentation2D(C); 
for i=1+1:size(S)-1
    ixL = S(i-1);
    ixC = S(i);
    ixR = S(i+1);
    pi_kb = C(ixL,:);
    pi_kf = C(ixR,:);
    pi_k  = C(ixC,:);
    [a1,b1,c1] = points_bisect_line_imp_2d(pi_k,pi_kb);
    [a2,b2,c2] = points_bisect_line_imp_2d(pi_k,pi_kf);
    [ival,center] = lines_imp_int_2d(a1,b1,c1,a2,b2,c2);
    if ival==1
       vector = pi_k-center; 
       radius = norm(vector);
       K = [K; 1/radius];       
       c = [c; center];
    end
end
end