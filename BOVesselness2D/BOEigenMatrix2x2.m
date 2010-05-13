function [L1,L2] = BOEigenMatrix2x2(a,b,c,d)
%% An analytic solution for the eigenvalues of 2x2 matrices.
%% Help: 
% http://en.wikipedia.org/wiki/Eigenvalue_algorithm
% http://www.math.harvard.edu/archive/21b_fall_04/exhibits/2dmatrices/index.html
%
%     | a  b |
% A = |      |
%     | c  d |
%
%% Eigenvalues
%% lambda = (a+d)/2 +- sqrt( (a+d)^2/4 + bc - ad )
l1 = (a + d)/2 + sqrt( (a + d).^2/4 + b.*c - a.*d );
l2 = (a + d)/2 - sqrt( (a + d).^2/4 + b.*c - a.*d );
%% Sort Eigenvalues -> |lambda1| <= |lambda2|
index = abs(l1)>abs(l2);
L1 = l1; 
L2 = l2;
L1(index) = l2(index);
L2(index) = l1(index);
%% TODO - Eigenvectors
% If c is not zero, then the eigenvectors are:
% | L1-d |   | L2-d |
% |      | , |      |
% |   c  |   |   c  |
% If b is not zero, then the eigenvectors are
% |   b  |   |   b  |
% |      | , |      |
% | L1-a |   | L2-a |
% If both b and c are zero, then the eigenvectors are
% |   1  |   |   0  |
% |      | , |      |
% |   0  |   |   1  |
%% 
% Vx = L1-d; %L1-L2
% Vy = b;
% %% Normalize the magnitudes of the eigenvectors by dividing by its length
% m = sqrt( Vx.^2 + Vy.^2 );
% m(m==0) = eps; %% TODO
% Vx = Vx./m; 
% Vy = Vy./m;
end