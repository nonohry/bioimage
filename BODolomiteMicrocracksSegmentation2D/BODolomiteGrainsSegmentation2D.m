function [imth,imvmax] = BODolomiteGrainsSegmentation2D(ims,s1,s2)
%%  BODolomiteGrainsSegmentation2D - grains segmentation using 
%%                                          local variance
%   
%   REFERENCE:
%       B. Obara, 
%       Identification of transcrystalline microcracks observed in 
%       microscope images of dolomite structure using image analysis 
%       methods based on linear structuring element processing,
%       Computers & Geosciences, 33, 2, 151–158, 2007
%
%   INPUT:
%       ims     - set of color images 
%       s1,s2   - size od line structuring element
%
%   OUTPUT:
%       imth    - segmented grain boundaries
%       imvmax  - max of local variance
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 15/11/2010 First implementation

%% Init
imvmax = zeros(size(ims,1),size(ims,2));
for i=1:size(ims,4)
    imrgb = ims(:,:,:,i);
    %% RGB to CIELab
    cform = makecform('srgb2lab');
    imLab = applycform(imrgb,cform);
    im = imLab(:,:,2);
    %% Normalize
    im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:)));
    %% Kernel
    se = strel('disk',s1);
    h = double(getnhood(se));
    %% Local Mean
    imm  = imfilter(im,h,'symmetric') / sum(h(:)); 
    %% Local Variance
    imv  = imfilter(im.^2,h,'symmetric') / sum(h(:)) - imm.^2; 
    %% Max
    imvmax = max(imvmax,imv);
end
%% Threshold
level = graythresh(imvmax);
imth = imvmax>level;
%% Post-processing
se = strel('disk',s2);
imo = imopen(imth,se);
imth = imreconstruct(imo,imth);
end