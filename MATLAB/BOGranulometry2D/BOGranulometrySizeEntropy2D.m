function H = BOGranulometrySizeEntropy2D(p,N)
%% Size Mean
H = 0;
for r=1:N
    h = p(r)*log(p(r));
    if isnan(h); h = 0; end    
    H = H + h; 
end
H = - H;
end