function nucleiFilteredPositions = ...
    BOStatDescriptor2D(imageIn,nucleiPositions,descriptorTable,...
        nucleiSize,resolutionXY)
%% BOStatDescriptor2D - calculate Statistical descriptor
%%
fprintf('BOStatDescriptor2D ... \n');
%% Setting the kernel and mask size
nucleiSizeXY = nucleiSize/resolutionXY;
distancemaxXY = round(nucleiSizeXY);
%%
nucleiPositions_tmp = nucleiPositions;
tableSize = size(nucleiPositions_tmp,1);
stop = 1; stopmin = 0; j = 1;
while(stop>0)
    ix = 1;
    if j>tableSize
        break;
    end
    m = 10000000;
    for i=1:tableSize
        if i~=j 
            d = sqrt( (nucleiPositions_tmp(i,1) - nucleiPositions_tmp(j,1))^2 + (nucleiPositions_tmp(i,2) - nucleiPositions_tmp(j,2))^2 );
            if m > d
                m = d; ix = i; jx = j;
            end
        end
    end
%%  
    if (m<distancemaxXY)
        s1 = descriptorTable(nucleiPositions_tmp(jx,3),4);        
        s2 = descriptorTable(nucleiPositions_tmp(ix,3),4);        
        if s1<s2
            nucleiPositions_tmp(jx,:) = [];
        else
            nucleiPositions_tmp(ix,:) = [];
        end
        stopmin = 1;
        tableSize = size(nucleiPositions_tmp,1);     

    end
    j = j + 1;
    if j>tableSize
        if stopmin>0
            stopmin = 0;
            j = 1;
        else
            stop = 0;
        end
    end
end
nucleiFilteredPositions = nucleiPositions_tmp;
nucleiFilteredPositions = sortrows(nucleiFilteredPositions, 3);
end
%%