function th = BOMidGreyThreshold2D(im,n,c)
%%  BOMidGreyThreshold2D - launch MidGrey's threshold algorithm 
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
%       (max-min) / 2 + c
%
%   USAGE:
%       th = BOMidGreyThreshold2D(im,n,c);
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
h = strel('disk',n);
%% Local Min
lmin = imerode(im,h);
%% Local Max
lmax = imdilate(im,h);
%% Level
level = (lmin + lmax)/2 - c ;
%% Threshold
th = im > level;
%% End
end