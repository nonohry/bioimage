function [G,H] = BOSteerableFiltersQuadraturePairs(sigma,order)
%% Grid coordinates
[x,y]   = ndgrid(-round(3*sigma):round(3*sigma));
%[x,y] = ndgrid(-3:1/sigma:3);
x = x/(sigma); y = y/(sigma); 
%% Quadrature pairs
if order==1
elseif order==2
    G = 0.9213*(2*x.^2-1);
    H = (-2.205*x + 0.9780*x.^3);
elseif order==3
    G = (2.472*x - 1.648*x.^3);
    H = (-0.9454 + 2.959*x.^2 - 0.6582*x.^4);
elseif order==4
    G = (0.9344  - 3.738*x.^2 + 1.246*x.^4);
    H = (2.858*x - 2.982*x.^3 + 0.3975*x.^5);
elseif order==5
end
G = G.*exp(-(x.^2+y.^2));
H = H.*exp(-(x.^2+y.^2));
%% Normalize
% TODO I don't know if this is needed ?
% G = G - sum(G(:))/numel(G);
% H = H - sum(H(:))/numel(H);
end