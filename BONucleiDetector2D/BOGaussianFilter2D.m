function imageOut = BOGaussianFilter2D(img,std)
%% BOGaussianFilter2D - convolving image with 2D Log
%%
DoG = BODoGFilter1D(std/2,std);
%%
imageOut = conv2(DoG,DoG,img,'same');
end