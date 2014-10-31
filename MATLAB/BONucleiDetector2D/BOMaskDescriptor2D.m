function descriptorTable = ...
    BOMaskDescriptor2D(imageIn,nucleiPositions,nucleiSize,resolutionXY)
%% BOMaskDescriptor2D - calculate mask descriptor
%%
fprintf('BOMaskDescriptor2D ... \n');
%% Setting the kernel and mask size
nucleiSizeXY = nucleiSize/resolutionXY;
distanceMaxValueXY = round(nucleiSizeXY);
descriptorTable = zeros(size(nucleiPositions,1),5);
%%
for i=1:size(nucleiPositions,1)
    [imageInMask valuesInMask]= ...
        BOCreateMask2D(imageIn,nucleiPositions(i,1),...
        nucleiPositions(i,2),distanceMaxValueXY);        
    valuesInMask = double(valuesInMask)/double(max(valuesInMask(:)));
    v = var(double(valuesInMask(:)));
    sd = std(double(valuesInMask(:)));
    m = mean(double(valuesInMask(:)));
    s = sum(double(valuesInMask(:)));    
    descriptorTable(i,1) = m;
    descriptorTable(i,2) = v;
    descriptorTable(i,3) = sd;    
    descriptorTable(i,4) = s;        
    descriptorTable(i,5) = i;
end
end