function sG = BOsGFilter2D(s,l,a)
%%  BOsGFilter2D - constructs the steerable-Gaussian filter
%   
%   REFERENCE:
%       S. Chaudhuri and S. Chatterjee and N. Katz and M. Nelson and 
%       M. Goldbaum, Detection of blood vessels in retinal images using 
%       two dimensional matched filters,
%       IEEE Transactions on Medical Imaging, 8, 3, 263-269, 1989
%
%   INPUT:
%       s   - sigma
%       l   - length of the kernel
%       a   - angle [radials]
%
%   OUTPUT:
%       sG  - filter
%
%   USAGE:
%       hG = BOsGFilter2D(3,10,0)
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 10/06/2010 First implementation


%% Grid
[x,y] = ndgrid(-l:l);
%% Rotation
u = x.*cos(a)-y.*sin(a);
v = x.*sin(a)+y.*cos(a);	
%% Mask
mask = (abs(u)<=3.0*s & abs(v)<=l/2);
%% Filter
sG = -exp(-(u.^2)/(2*s^2)); % (1/sqrt(2*pi*s.^2)).*
sG(~mask) = 0;    
%% Normalization
sGmean = sum(sG(:))/sum(mask(:));
sG(mask) = sG(mask)-sGmean;
end