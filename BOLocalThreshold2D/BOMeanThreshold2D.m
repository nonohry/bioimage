function th = BOMeanThreshold2D(im,n,c)
%%  BOMeanThreshold2D - launch Mean's threshold algorithm 
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
%       th  = BOMeanThreshold2D(im,n,c);
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
%% Local Mean
% m = sum(x)/n
m  = imfilter(im,h,'symmetric') / sum(h(:)); 
%% Level
level = m - c ;
%% Threshold
th = im > level;
%% End
end