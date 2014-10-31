function [V,Vmax] = BOVesselness2D(im,sigma,gamma,beta,c,wb )
%%  BOVesselness2D - multiscale vessel enhancement filtering
%   
%   REFERENCE:
%       A.F. Frangi, et al., 
%       Multiscale Vessel Enhancement Filtering,
%       Lecture Notes in Computer Science, 1496, 130-137, 1998
%
%   INPUT:
%       im      - 2D gray image,
%       sigma   - Gaussian kernel sigma [1 2 3 ...],
%       gamma   - vesselness threshold parameter,
%       beta    - vesselness threshold parameter,
%       c       - vesselness threshold parameter,
%       wb      - detect black or white regions.
%
%   OUTPUT:
%       Vmax    - vesselness,
%       V       - cell of all vesselness images for each sigma
%
%   USAGE:
%       im = double(imread ('in.tif'));
%       sigma = 0.5:0.5:1; gamma = 2; beta = 0.5; c = []; wb = true;
%       [V,Vmax] = BOVesselness2D(im,sigma,gamma,beta,c,wb);
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 22/04/2009 First implementation
%       0.2 - 16/10/2009 Fast approach
%       0.3 - 11/04/2010 im2uint8

%% Default Parameters
if isempty(sigma);  sigma = 1;  end
if isempty(gamma);  gamma = 2;  end
if isempty(beta);   beta = 0.5; end
if isempty(c);      c = 15;     end
if isempty(wb);     wb = true;  end
%% Normalize
im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:)));
%% Convert Image to Grey-Scale
im = im2uint8(im); % I assume that Vesselness was defined for grey-scale images
%% Convert Image to Double
im = double(im);
%% Start Loop
[m,n] = size(im);
V = zeros(m,n,length(sigma)); 
for i=1:length(sigma)
%% Second Derivatives - Hessian Matrix
    [Hxx,Hxy,Hyy] = BOHessianMatrix2D(im,sigma(i));
%% Normalized Derivative - Scale
    Hxx = power(sigma(i),gamma)*Hxx;
    Hxy = power(sigma(i),gamma)*Hxy;
    Hyy = power(sigma(i),gamma)*Hyy;
%% Eigen Matrix - values and vectors
    [L1,L2] = BOEigenMatrix2x2(Hxx,Hxy,Hxy,Hyy);
    %[L1,L2,V1,V2,V3,V4] = BOEigenMatrix2x2M(Hxx,Hxy,Hxy,Hyy);
    L2(L2==0) = eps;
    Rbeta = L1./L2;
    S = sqrt(L1.^2 + L2.^2);     
%% Compute Filtered Image    
    Vo = exp(-(Rbeta.^2)/(2*beta^2)).*(ones(size(im))-exp(-(S.^2)/(2*c^2)));  
%% TODO     half the value of the maximum Hessian norm has proven to work
%% If |lambda2 > 0| or |lambda2 < 0|  => Vo = 0
    if(wb)
        Vo(L2<0) = 0;
    else
        Vo(L2>0) = 0;
    end    
%% Table of Vo
    V(:,:,i) = Vo;
end
%% Calculate Maximum Image Over the Scales
if length(sigma)>1
    Vmax = max(V,[],3);
else
    Vmax = V;
end
%% End
end
