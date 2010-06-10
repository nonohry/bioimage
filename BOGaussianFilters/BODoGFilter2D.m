function DoG = BODoGFilter2D(s1,s2)
%%  BODoGFilter2D - Difference of Gaussian filter
%   
%   REFERENCE:
%
%   INPUT:
%       s1,s2   - sigmas.
%
%   OUTPUT:
%       DoG     - 2D DoG filter
%
%   USAGE:
%       DoG = BODoGFilter2D(3)
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 21/05/2010 First implementation

%% Grid coordinates
[x,y]   = ndgrid(-3*max(s1,s2):3*max(s1,s2));
%% DoG = G1 - G2;
DoG = (1/(2*pi))*...
((1/s1^2)*exp(-(x.^2+y.^2)/(2*s1^2))-(1/s2^2)*exp(-(x.^2+y.^2)/(2*s2^2)));
end