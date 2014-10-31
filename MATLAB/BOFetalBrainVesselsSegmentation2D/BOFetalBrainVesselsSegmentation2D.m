function th = BOFetalBrainVesselsSegmentation2D(im,s)
%%  BOFetalBrainVesselsSegmentation2D - fetal brain vessels segmentation
%   
%   REFERENCE:
%       T. Stepien and B. Obara, 
%       The cycloid and skeletonization methods 
%       for morphometric analysis of fetal brain vessels, 
%       Folia Neuropathol, vol. 46, no. 4, pp. 278-285, 2008.
%
%   INPUT:
%       im  - input image (RGB)
%       s   - filter size
%
%   OUTPUT:
%       th  - output image
%
%   USAGE:
%       imth = BOFetalBrainVessels(im,5)
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 01/08/2010 First implementation
%% Setup
if nargin<2; s = 15; end
%% Color Transformation - luminance (Y), hue (I), and saturation (Q)
imYIQ = rgb2ntsc(im); 
%% Select hue (I)
im = imYIQ(:,:,2);
%% Normalize
im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:)));
%% TopHat
se = strel('disk',s);
imf = imtophat(im,se);
%% Segmentation
th = imf>graythresh(imf);
%% Erode
s = 1;
se = strel('disk',s);
th = imerode(th,se);
%%
end