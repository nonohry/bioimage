function th = BOMedianThreshold2D(im,n,c)
%%  BOMedianThreshold2D - launch Median's threshold algorithm 
%   
%   REFERENCE:
%   
%   INPUT:
%       im      - input image
%       n       - window size, 15 
%       c       - constant value, 0
%
%   OUTPUT:
%       th      - output image
%
%   HELP:
%
%   USAGE:
%       th = BOMedianThreshold2D(im,m,n,c);
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
        c = 0;
    case 2
        c = 0;
end
%% Convert To Gray Scale Image
im = double(im2uint8(im));
%% Kernel
se = strel('disk',n);
h = double(getnhood(se));
%% Local Median
m  = ordfilt2(im,median(1:sum(h(:))),h,'symmetric');
%% Level
level = m - c ;
%% Threshold
th = im > level;
%% End
end