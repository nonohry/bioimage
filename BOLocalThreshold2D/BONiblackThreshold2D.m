function th = BONiblackThreshold2D(im,n,k)
%%  BONiblackThreshold2D - launch Niblack's threshold algorithm 
%   
%   REFERENCE:
%       W. Niblack, An Introduction to Digitall Image Processing, 
%       Prentice-Hall, Englewood Cliffs, NJ, 1986.
%   
%   INPUT:
%       im      - input image
%       n       - window size, 15 
%       k       - weight value, normally in [-1,0], -0.2
%
%   OUTPUT:
%       th      - output image
%
%   HELP:
%       k > 0 - for images with white foreground objects 
%       k < 0 - for images with black foreground
%
%   USAGE:
%       th = BONiblackThreshold2D(im,n,w);
%       imagesc(th);
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 22/10/2009 First implementation

%% Setup - fill in unset optional values.
switch nargin
    case 1
        n = 15;
        k = -0.2;
    case 2
        k = -0.2;
end
%% Convert To Gray Scale Image
im = double(im2uint8(im));
%% Kernel
se = strel('disk',n);
h = double(getnhood(se));
%% Local Mean
% m = sum(x)/n
m  = imfilter(im,h,'symmetric') / sum(h(:)); 
%% Local Variance
% v = sum(x-m)^2/n = sum(x^2-2xm+m^2)/n = (sum(x^2)-2msum(x)+m^2)/n = 
%   = (sum(x^2)-2m^2+m^2)/n = sum(x^2)/n-m^2 
% v  = imfilter(im.^2,h,'symmetric') / numel(h) - m.^2; 
v  = imfilter(im.^2,h,'symmetric') / sum(h(:)) - m.^2; 
%% Local Std
% s = sqrt(v)
s = sqrt(v);
%% Level
level = m + k * s;
%% Threshold
th = im > level;
%% End
end