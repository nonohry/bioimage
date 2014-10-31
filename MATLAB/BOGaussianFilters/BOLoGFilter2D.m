function LoG = BOLoGFilter2D(s)
%%  BOLoGFilter2D - Laplacian of Gaussian filter
%   
%   REFERENCE:
%
%   INPUT:
%       s   - sigma.
%
%   OUTPUT:
%       LoG - 2D LoG filter
%
%   USAGE:
%       log = BOLoGFilter1D(10,3)
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 21/05/2010 First implementation

%% Grid coordinates
[x,y]   = ndgrid(-3*s:3*s);
%% LoG = Gxx + Gyy
LoG = (1/(2*pi*s^2)) * ((x.^2+y.^2-2*s^2)/s^4) .* exp(-(x.^2+y.^2)/(2*s^2));
end


