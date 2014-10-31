function [A,N] = BOGranulometryArea2D(im,B)
%% Size Distribution Function
a = 1; r = 0; A = [];
while a>0
    se = strel('disk',r*B);
    im = imopen(im,se);
    a = sum(im(:));
    %if a>0
        A = [A a];
    %end
    r = r + 1;
end
N = r - 1; 
%% 
end