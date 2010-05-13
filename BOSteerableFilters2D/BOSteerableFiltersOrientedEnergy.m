function imE = BOSteerableFiltersOrientedEnergy(im,G,H)
%% Orientation analysis using steerable filters
imE = zeros(size(im,1),size(im,2),size(G,3));
for i=1:size(G,3)
    imG = imfilter(im,G(:,:,i),'same','replicate');
    imH = imfilter(im,H(:,:,i),'same','replicate');
    imE(:,:,i) = imG.^2 + imH.^2;
end
end