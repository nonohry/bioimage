function nucleiPositions = ...
            BOLoGDetector2D(imageIn,nucleiSize,resolutionXY,thValue)
%% BOLoGDetector2D - calculate 2D log
%%
fprintf('BOLoGDetector3D ... \n');
%% Setting the kernel and mask size
nucleiSizeXY = nucleiSize/resolutionXY;
kernelSigma = 3; % TODO
masksizeXY = round(nucleiSizeXY);
%% Gauss filtering
imageGauss = ...
    BOGaussianFilter2D(imageIn,kernelSigma);
%% Seeds searching
nucleiPositions = BOSeedSearch2D(imageGauss,masksizeXY,thValue);
nucleiPositions(:,3) = (1:size(nucleiPositions,1))';
end
