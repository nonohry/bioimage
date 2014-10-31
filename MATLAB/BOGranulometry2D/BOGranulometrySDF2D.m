function p = BOGranulometrySDF2D(A,N)
%% Size Density Function
p = [];
for r=1:N
    p = [p  1/A(1)*(A(r)-A(r+1))];
end
end