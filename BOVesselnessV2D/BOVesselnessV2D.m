function [V,Vmax,Vidx,Vx,Vy,L1,L2] = BOVesselnessV2D(im,sigma,gamma,beta,c,wb)
%%  BOVesselnessV2D - multiscale vessel enhancement filtering + vectors
%   
%   REFERENCE:
%       A.F. Frangi, et al., 
%       Multiscale Vessel Enhancement Filtering,
%       Lecture Notes in Computer Science, 1496, 130-137, 1998
%
%       B. Obara, , et al., 
%       Contrast-independent curvilinear structure detection in biomedical 
%       images, IEEE Transactions on Image Processing 2012, 
%       doi:10.1109/TIP.2012.2185938 
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
Vxt = zeros(m,n,length(sigma)); Vyt = zeros(m,n,length(sigma));
V = zeros(m,n,length(sigma)); Vx = zeros(m,n); Vy = zeros(m,n);
for i=1:length(sigma)
%% Second Derivatives - Hessian Matrix
    [Hxx,Hxy,Hyy] = BOHessianMatrix2D(im,sigma(i));
%% Normalized Derivative - Scale
    Hxx = power(sigma(i),gamma)*Hxx;
    Hxy = power(sigma(i),gamma)*Hxy;
    Hyy = power(sigma(i),gamma)*Hyy;
%% Filter Hessian    
%     s = 3;
%     h = fspecial('gaussian',3*s,s);
%     Hxx = imfilter(Hxx,h,'same');
%     Hxy = imfilter(Hxy,h,'same');
%     Hyy = imfilter(Hyy,h,'same');
%% Eigen Matrix - values and vectors
    %[L1,L2] = BOEigenMatrix2x2M(Hxx,Hxy,Hxy,Hyy);
    %[L1,L2,V1,V2,V3,V4] = BOEigenDecompositionMatrix2x2IDX(Hxx,Hxy,Hxy,Hyy);
    %Vxt(:,:,i) = V3; Vyt(:,:,i) = V4;
    [L1,L2,V1,V2,V3,V4] = BOEigenMatrix2x2M(Hxx,Hxy,Hxy,Hyy);
    Vxt(:,:,i) = V1; Vyt(:,:,i) = V2;
    %%Vxt(:,:,i) = V3; Vyt(:,:,i) = V4;
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
    [Vmax,Vidx] = max(V,[],3);
    for i=1:m
        for j=1:n
            Vx(i,j) = Vxt(i,j,Vidx(i,j)); 
            Vy(i,j) = Vyt(i,j,Vidx(i,j));
        end
    end
else
    Vmax = V;
    Vidx = ones(size(Vmax));
    Vx = Vxt(:,:,1); Vy = Vyt(:,:,1);
end
%% End
end