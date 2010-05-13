function th = BOSauvolaThreshold3D(im,n1,n2,k,R)
%%  BOSauvolaThreshold3D - launch Sauvola's threshold algorithm 
%   
%   REFERENCE:
%       J. Sauvola and M. Pietikainen, 
%       Adaptive document image binarization, 
%       Pattern Recognition, 33, 2, 225-236, 2000.
%
%   INPUT:
%       im      - input image
%       n1      - radius (x,y) 
%       n1      - height (z)
%       k       - weight value, normally is a positive number in [0,1], 0.5
%       R       - dynamic range of the standard deviation, normally is 128 
%
%   OUTPUT:
%       th      - output image
%
%   HELP:
%
%   USAGE:
%       th = BOSauvolaThreshold3D(im,n1,n2,k,R);
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
        k = 0.5;
        R = 128;        
    case 2
        k = 0.5;
        R = 128;        
    case 3
        R = 128;        
end
%% Convert To Gray Scale Image
im = double(im2uint8(im));
%% Kernel
se = strel('ball',n1,n2);
h = double(getnhood(se));
%% Local Mean
% m = sum(x)/n
m  = imfilter(im,h,'symmetric') / sum(h(:)); 
%% Local Variance
% v = sum(x-m)^2/n = sum(x^2-2xm+m^2)/n = (sum(x^2)-2msum(x)+m^2)/n = 
%   = (sum(x^2)-2m^2+m^2)/n = sum(x^2)/n-m^2 
v  = imfilter(im.^2,h,'symmetric') / sum(h(:)) - m.^2; 
%% Local Std
% s = sqrt(v)
s = sqrt(v);
%% Level
level = m .* (1.0 + k * (s / R - 1.0));
%% Threshold
th = im > level;
%% End
end