function nucleiPositions = ...
    BONucleiDetector2D(imageNuclei,imageMembrane,...
    nucleiSize,thValue,resolutionXY)
%%  BONucleiDetector2D - 2D nuclei detector
%   
%   REFERENCE:
%       B. Obara and D. Fedorov and C.D. Banna and B.S. Manjunath,
%       Automatic system for detection and validation of cell nuclei in 
%       3D CLS microscopy imagery,
%       Bioinformatics, 2010. SOON :)
%
%   INPUT:
%       imageNuclei     - nuclei channel,
%       imageMembrane   - membrane channel,
%       nucleiSize      - nuclei size [microns],
%       thValue         - lowest intensity bound,
%       resolutionXY    - pixel size, 
%
%   OUTPUT:
%       nucleiPositions - detected nuclei positions
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 30/06/2009 First implementation

%% LoG
[nucleiPositions] = ...
    BOLoGDetector2D(imageNuclei,nucleiSize,resolutionXY,thValue);
%% Filtering
descriptorTable = ...
    BOMaskDescriptor2D(imageNuclei,nucleiPositions,nucleiSize,...
    resolutionXY);
if ~isempty(imageMembrane)
    nucleiPositions = ...
    BOProfileDescriptor2D(imageMembrane,nucleiPositions,descriptorTable,...
    nucleiSize*1.5,resolutionXY);
else
    nucleiPositions = ...
    BOStatDescriptor2D(imageNuclei,nucleiPositions,descriptorTable,...
    nucleiSize*1.5,resolutionXY);
end
%%
end