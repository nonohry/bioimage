function [G,H] = BOSteerableFilters2D(sigma,theta,order)
%%  BOSteerableFilters2D - design steerable filters
%   
%   REFERENCE:
%       W.T. Freeman and E.H. Adelson, 
%       The Design and Use of Steerable Filters, 
%       IEEE Transactions on Pattern Analysis and Machine Intelligence,
%       13, 891-906, 1991.
%
%   INPUT:
%       sigma   - Gaussian kernel sigma
%       theta   - kernel rotations
%       order   - filter order (derivative order)
%
%   OUTPUT:
%       G       - Gaussian derivative
%       H       - Polynomial fit to its Hilbert transform
%
%   USAGE:
%       sigma = 10; order = 2; theta = [0 pi/4 pi/2];
%       [G,H] = BOSteerableFilters2D(sigma,theta,order);
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 08/04/2010 First implementation

%% Construct basic functions
[G0,H0] = BOSteerableFiltersQuadraturePairs(sigma,order);
thetajG = BOSteerableFiltersBasicFunctionsOrientations(order);
thetajH = BOSteerableFiltersBasicFunctionsOrientations(order+1);
Gbf = zeros(size(G0,1),size(G0,1),length(thetajG));
Hbf = zeros(size(H0,1),size(H0,1),length(thetajH));
for j=1:length(thetajG)
    Gbf(:,:,j) = BOSteerableFiltersRotate(G0,thetajG(j));
end
for j=1:length(thetajH)
    Hbf(:,:,j) = BOSteerableFiltersRotate(H0,thetajH(j));
end
%% Construct kernel for particular theta
G = zeros(size(G0,1),size(G0,1),length(theta));
H = zeros(size(H0,1),size(H0,1),length(theta));
for i=1:length(theta)
    kG = BOSteerableFiltersPolynomials(theta(i),thetajG,order);
    kH = BOSteerableFiltersPolynomials(theta(i),thetajH,order+1);
    for j=1:length(thetajG)
        G(:,:,i) = imadd(G(:,:,i),kG(j)*Gbf(:,:,j));
    end 
    for j=1:length(thetajH)
        H(:,:,i) = imadd(H(:,:,i),kH(j)*Hbf(:,:,j));    
    end 
end
end
%%-------------------------------------------------------------------------
%% sub-functions
%%-------------------------------------------------------------------------
function thetaj = BOSteerableFiltersBasicFunctionsOrientations(order)
% order - polynomial order
j = 1:order+1;
thetaj = (j-1)*pi/(order+1);
end
function GHrot = BOSteerableFiltersRotate(GH,theta)
GHrot = imrotate(GH,theta*180/pi,'bicubic','crop');
end