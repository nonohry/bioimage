function [imageInMask valuesInMask] = ...
                                    BOCreateMask2D(imageIn,x,y,maskSizeXY)  
%% BOCreateMask2D - create 2D mask
%%
imageMask = false(size(imageIn));
imageMask(x, y) = 1;
seUp = strel('disk',maskSizeXY);
seDown = strel('disk',maskSizeXY-2);

imageMask = logical(imdilate(imageMask,seUp));
imageInMask = immultiply(imageIn, imageMask);
valuesInMask = imageInMask(imageMask==1);
end