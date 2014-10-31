function imsk = BOSandstoneMicrocracksSegmentation2D(im,s1,s2,nr)
%%  BOSandstoneMicrocracksSegmentation2D - microcracks segmentation
%   
%   REFERENCE:
%       Boguslaw Obara and Alena Kozusnikova and Jiri Scucka,
%       Automatic identification of microcracks observed on microscopic 
%       images of coarse-grained sandstone,
%       International Journal of Rock Mechanics and Mining Sciences,
%       48, 4, 681-686, 2011.
%
%   INPUT:
%       im      - image
%       s1      - size
%       s2      - size
%       nr      - number of rotations
%
%   OUTPUT:
%       imsk    - skeleton 
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 13/07/2010 First implementation
%       0.2 - 13/10/2010 Small updates

%% Top-Hat
immax = zeros(size(im),class(im));
for i=0:(180/nr):180-(180/nr)
    se = strel('line',s1,i);
    imtop = imtophat(im,se);
    immax = max(imtop,immax);
end
%% Threshold
level = graythresh(immax);
imth = immax>level;
%% Filter
immax = zeros(size(im))==1;
for i=0:(180/nr):180-(180/nr)
    se = strel('line',s2,1);
    ime = imerode(imth,se);
    imrec = imreconstruct(ime,imth);
    immax = max(immax,imrec);
end
%% Skeleton
imsk = bwmorph(immax,'skel',Inf);
imsk = bwmorph(imsk,'spur',1);
end