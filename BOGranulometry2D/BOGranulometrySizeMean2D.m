function E = BOGranulometrySizeMean2D(p,N)
%% Size Mean
E = 0;
for r=1:N
    E = E + (r-1)*p(r); 
end
end



