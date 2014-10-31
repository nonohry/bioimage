function th = BOBernsenThreshold2D(im,n,c)
%%  BOBernsenThreshold2D - launch Bernsen's threshold algorithm 
%   
%   REFERENCE:
%       M. Sezgin and B. Sankur,
%       Survey over Image Thresholding Techniques 
%       and Quantitative Performance Evaluation, 
%       Journal of Electronic Imaging, 13, 1, 146-165, 2004
%   
%   INPUT:
%       im      - input image
%       n       - window size, 31
%       c       - constant threshold value, 15
%
%   OUTPUT:
%       th      - output image
%
%   HELP:
%
%   USAGE:
%       th = BOBernsenThreshold2D(im,n,c);
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
        n = 31;
        c = 15;
    case 2
        c = 15;
end
%% Convert To Gray Scale Image
im = double(im2uint8(im));
%% Kernel
h = strel('disk',n);
%% Local Min
lmin = imerode(im,h);
%% Local Max
lmax = imdilate(im,h);
%% Local Contrast
lc = lmax - lmin;
%% Middle Gray
mg = (lmin + lmax)/2;
%% IF by indexing
ix1 = lc < c;
ix2 = lc >= c;
%% Threshold
th = zeros(size(im))==1;
th(ix1) = mg(ix1) >= 128;
th(ix2) = im(ix2) >= mg(ix2);
%% End
end