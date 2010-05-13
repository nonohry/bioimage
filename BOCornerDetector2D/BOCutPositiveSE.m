function seneg = BOCutPositiveSE(se)
%%  BOCutPositiveSE - function cut the positive part of the matrix 'se'
%   
%   REFERENCE:
%       Alina Sobania, J. Paul O. Evans, 
%       Morphological corner detector using paired 
%       triangular structuring elements, 
%       Pattern Recognition 38, 1087-1098, 2005
%   
%   INPUT:
%       se      - structuring element
%
%   OUTPUT:
%       seneg   - negative part of 'se'
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 15/11/2008 First implementation

%%
[yS, xS] = size(se);
y1 = 0; y2 = 0;
for y = 1:yS
    ss = 0;
    for x = 1:xS
        ss = ss + se(y, x);
    end
    if ss > 0 
        if y1 == 0 
            y1 = y;
        end
    end
    if ss == 0
        if y1 > 0 && y2 == 0 
            y2 = y;
        end        
    end
end
%%
x1 = 0; x2 = 0;
for x = 1:xS
    ss = 0;
    for y = 1:yS
        ss = ss + se(y, x);
    end
    if ss > 0 
        if x1 == 0 
            x1 = x;
        end
    end
    if ss == 0
        if x1 > 0 && x2 == 0 
            x2 = x;
        end        
    end
end
%%
seneg = zeros(y2-y1,x2-x1);
for y = 1:yS
    for x = 1:xS
        if y >= y1 && y < y2         
            if x >= x1 && x < x2 
                seneg(int8(y-y1+1),int8(x-x1+1)) = se(y, x);
            end        
        end     
    end
end
%%
end
