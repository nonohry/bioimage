function [a1,a2,a3,a4,cfun] = BOCurvilinearStructureProfileParameters2D(x,y,a01,a02,a03,a04)
%%  BOCurvilinearStructureProfileParameters2D - determines a set of 
%             parameters characterising the curvilinear structure profile
%   
%   REFERENCE:
%       N Chapman, N Witt, X Gao, A Bharath, A Stanton, S Thom, A Hughes,  
%       Computer algorithms for the automated measurement of retinal 
%       arteriolar diameters,
%       British Journal of Ophthalmology, 85, 74-79, 2001
%
%   INPUT:
%       x,y     - profile coordinates,
%       a01     - the amplitude of the Gaussian function, 
%       a02     - the peak position of the curve along x-axis,
%       a03     - the spread of the Gaussian curve,
%       a04     - the grey level of the background.  
%
%   OUTPUT:
%       a1      - the amplitude of the Gaussian function, 
%       a2      - the peak position of the curve along x-axis,
%       a3      - the spread of the Gaussian curve,
%       a4      - the grey level of the background,
%       cfun    - fit.
%
%   HELP:
%       width = 2.33 * a3;
%
%   USAGE:
%       [a1,a2,a3,a4] = BOCharacterizationCurvilinearStructures(x,y)
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 18/11/2009 First implementation

%% Starting parameters
if nargin == 2
    a01 = max(y)-min(y);            % amplitude
    a02 = find(y==max(y),1,'first');% peak position
    a03 = 1;                        % sigma
    a04 = min(y);
end
%% Fit    
ops = fitoptions('Method','NonlinearLeastSquares','StartPoint',...
                    [a01 a02 a03 a04]);
model = fittype('a1 * exp( -((x - a2) / a3)^2 ) + a4','options',ops);
cfun = fit(x,y,model);
%% Output
c = coeffvalues(cfun);
a1 = c(1); a2 = c(2); a3 = c(3); a4 = c(4);
end