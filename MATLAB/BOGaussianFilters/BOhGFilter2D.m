function hG = BOhGFilter2D(s,a)
%%  BOhGFilter2D - constructs the steerable half-Gaussian filter
%   
%   REFERENCE:
%       F.G.A. Faas and L.J. van Vliet, 
%       Junction detection and multi-orientation analysis using 
%       streamlines, Computer Analysis of Images and Patterns, 
%       4673, 718-725, 2007
%
%   INPUT:
%       s   - sigma,
%       a   - angle [radials],
%
%   OUTPUT:
%       hG  - filter for the direction given by: n = [cos(a),sin(a)]
%
%   HELP:
%       hG = G(|u|,sigmaF)H(u*n)(u*n)^2
%       where: 
%           u - x,y coordinaties, H - Heaviside function, * - dot product
%
%   USAGE:
%       hG = BOhGFilter2D(3,0)
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 22/05/2010 First implementation

%% Direction vector
n = [cos(a) sin(a)];
%% Quadrature filter
[x,y] = ndgrid(-round(5*s):round(5*s));
G = (1/(2*pi*s.^2)).*exp(-(x.^2+y.^2)/(2*s^2));
%% Dot product
xc = reshape(x,1,[]); % Coordinaties
yc = reshape(y,1,[]);
u = [xc; yc]';
un = u*n';
un2 = un.^2;
%% Heaviside
H = BOHeaviside(un);
Hun2 = H.*un2;
Hun2r = reshape(Hun2,length(x),length(y));
%% half Gaussian
hG = G.*Hun2r;
%% Normalization
hG = hG./sum(hG(:));
end

function Y = BOHeaviside(X)
%% HEAVISIDE - step function
Y = zeros(size(X));
Y(X > 0) = 1;
Y(X == 0) = .5;
%% End
end