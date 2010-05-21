function DoG = BODoGFilter1D(s1,s2)
%%  BODoGFilter1D - Difference of Gaussian filter
%   
%   REFERENCE:
%
%   INPUT:
%       s1,s2   - sigmas.
%
%   OUTPUT:
%       DoG     - 1D DoG filter
%
%   USAGE:
%       DoG = BODoGFilter1D(3)
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 21/05/2010 First implementation

%% Grid coordinates
x = (-3*max(s1,s2):3*max(s1,s2))';
%% DoG = G1 - G2
DoG = 1/sqrt(2*pi)*( 1/s1*exp(-x.^2/(2*s1^2))-1/s2*exp(-x.^2/(2*s2^2)));
DoG = DoG + abs(min(DoG(:)));
end