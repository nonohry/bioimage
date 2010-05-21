function out = BOPruning2D(im,steps)
%%  BOPruning2D - 2D pruning by endpoints 
%   
%   INPUT:
%       im    - binary image.
%       steps - number of steps: 1,2, ....n.
%
%   OUTPUT:
%       out     - image with detected points
%
%   USAGE:
%        % Skeleton
%        sk = bwmorph(im,'thin',inf);
%        % Pruning
%        pr = BOPruning2D(sk,10);
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 25/08/2008 First implementation

%% Pruning
out = im;
i = 0;
while i<=steps
    hom = BOHitOrMissE2D(out,'end');
    if sum(hom(:))==0
        break;
    else
        out = immultiply(out,~hom);
        i = i + 1;
    end
end
%%
end