function [Hxx,Hxy,Hyy] = BOHessianMatrix2D(im,s)
%% Gaussian 2nd derivatives
[Gxx,Gxy,Gyy] = BOGaussian2ndDerivatives(s) ;
%% Hessian Matrix
Hxx = imfilter(im,Gxx,'conv','same','replicate');
Hxy = imfilter(im,Gxy,'conv','same','replicate');
Hyy = imfilter(im,Gyy,'conv','same','replicate');
%% End
end