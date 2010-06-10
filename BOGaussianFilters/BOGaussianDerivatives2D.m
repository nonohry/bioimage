function [G,Gx,Gy,Gxx,Gyy,Gxy,Gyx] = BOGaussianDerivatives2D(s)
%%  BOGaussianDerivatives2D - derivatives of 2D Gaussian function
%   
%   REFERENCE:
%
%   INPUT:
%       s   - sigma.
%
%   OUTPUT:
%       G,Gx,Gy,Gxx,Gyy,Gxy,Gyx - derivatives
%
%   HELP:
%       syms x y s;
%       G = sqrt(2*pi*s^2)*exp(-(x.^2 + y.^2)/(2*s^2))
%       Gx = diff(G,x,1);
%       Gy = diff(G,y,1);
%       Gxx = diff(G,x,2);
%       Gyy = diff(G,x,2);
%       Gxy = diff(Gx,y,1);
%       Gyx = diff(Gy,x,1);
%       1/(sqrt(2*pi)*s)^N  - where N is a dimension
%
%   USAGE:
%       [G,Gx,Gy,Gxx,Gyy,Gxy,Gyx] = BOGaussianDerivatives2D(3)
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 21/05/2010 First implementation


%% Grid coordinates
[x,y]   = ndgrid(-round(3*s):round(3*s));
%% Derivatives
G   =  1/(2*pi*s^2)                  .* exp(-(x.^2+y.^2)/(2*s^2));
Gx  = -1/(2*pi*s^2) *         x/s^2  .* exp(-(x.^2+y.^2)/(2*s^2));
Gy  = -1/(2*pi*s^2) *         y/s^2  .* exp(-(x.^2+y.^2)/(2*s^2));
Gxx =  1/(2*pi*s^2) * (x.^2-s^2)/s^4 .* exp(-(x.^2+y.^2)/(2*s^2));
Gyy =  1/(2*pi*s^2) * (y.^2-s^2)/s^4 .* exp(-(x.^2+y.^2)/(2*s^2));
Gxy =  1/(2*pi*s^2) *     (x.*y)/s^4 .* exp(-(x.^2+y.^2)/(2*s^2));
Gyx =  1/(2*pi*s^2) *     (x.*y)/s^4 .* exp(-(x.^2+y.^2)/(2*s^2));
end