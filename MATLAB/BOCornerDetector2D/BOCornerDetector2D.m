function imcorner = BOCornerDetector2D(im,nrot,s)
%%  BOCornerDetector - corners detection
%   
%   REFERENCE:
%       Alina Sobania, J. Paul O. Evans, 
%       Morphological corner detector using paired triangular structuring 
%       elements, Pattern Recognition 38, 1087-1098, 2005
%   
%   INPUT:
%       im      - binary image
%       nrot    - number of rotations
%       s       - size of structuring element
%
%   OUTPUT:
%       imcorner - image with detected corners
%
%   USAGE:
%       imcorner = BOCornerDetector(im,4,6);
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 15/11/2008 First implementation

%%
imcorner = zeros(size(im));
%%
se = zeros((s-1),(s-1));
for x = 1:s
    for y = 1:s
        t = abs(x) + abs(y); 
        if t <= s 
            se(x,y) = 1;
        end
    end
end
%%
se90 = zeros(2*(s-1)+4,2*(s-1)+4);
for n = 0:nrot
    angle = n*pi/nrot;
    shift = int8((s-1)+2);
    for x = 1:(s-1)
        for y = 1:(s-1)
            if(se(x, y) == 1)
                xp = x*cos(angle) + y*sin(angle); 
                yp = -x*sin(angle) + y*cos(angle); 
                se90(shift+int8(xp),shift+int8(yp)) =  1;
            end
        end
    end
    se90neg = BOCutPositiveSE(se90);
    imo = imopen(im, se90neg);
    ims = im - imo;
    imcorner = max(ims, imcorner);
    se90 = zeros(size(se90));  
end
imcorner = imclearborder(imcorner,4);
imcorner = logical(imcorner);
%%
end
