function [x,y] = BOFindContour2D(im,type) 
%%  BOFindContour2D - find contour points of the curve
%
%   INPUT:
%       im      - binary image with contour/curve.
%       type    - type of the contour: 'close' or 'open'.
%
%   OUTPUT:
%       x,y     - x and y coordinaties of the contour
%
%   USAGE:
%       % Skeleton
%       sk = bwmorph(im, 'thin', inf);
%       % Hit or Miss
%       [x,y] = BOFindContour2D(im,'close') 
%
%   AUTHOR: 
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 22/09/2008 First implementation
        
%%
[row, col] = find(im,1);
contour = bwtraceboundary(im, [row, col], 'N');
if strcmp(type,'open')
    contour = contour(1:round(size(contour,1)/2),:);
elseif strcmp(type,'close')
    contour = contour;
end
y = contour(:,1); 
x = contour(:,2); 
%%
end