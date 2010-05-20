function [E,H,A,p,N] = BOGranulometry2D(im,B)
%%  BOGranulometry2D - 2D granulometry measures
%
%   INPUT:
%       im      - binary image.
%       B       - size of the structuring element.
%
%   OUTPUT:
%       E       - size mean
%       H       - size entropy
%       A       - size distribution function
%       p       - size density function
%       N       - max size contained in an image
%
%   USAGE:
%       [E,H,A,p,N] = BOGranulometry2D(im,B);
% 
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 25/06/2009 First implementation

%% Area - Size Distribution Function
[A,N] = BOGranulometryArea2D(im,B);
%% Size Density Function
p = BOGranulometrySDF2D(A,N);
%% Size Mean
E = BOGranulometrySizeMean2D(p,N);
%% Size Entropy
H = BOGranulometrySizeEntropy2D(p,N);
end