function LoG = BOLoGFilter1D(s)
%%  BOLoGFilter1D - Laplacian of Gaussian filter
%   
%   REFERENCE:
%
%   INPUT:
%       s   - sigma.
%
%   OUTPUT:
%       LoG - 1D LoG filter
%
%   USAGE:
%       LoG = BOLoGFilter1D(3)
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 21/05/2010 First implementation

%% Grid coordinates
x = (-3*s:3*s)';
%% LoG = Gxx + Gyy
LoG = 1/(sqrt(2*pi)*s) * ((x.^2-s^2)/s^4).*exp(-x.^2./(2*s^2));
end