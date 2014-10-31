function k = BOSteerableFiltersPolynomials(theta,thetaj,order)
%% Steering parity polynomials
if order==1
    k = 1/2*(2*cos(theta-thetaj));
elseif order==2
    k = 1/3*(1 + 2*cos(2*(theta-thetaj)));
elseif order==3
    k = 1/4*(2*cos(theta-thetaj) + 2*cos(3*(theta-thetaj)));
elseif order==4
    k = 1/5*(1 + 2*cos(2*(theta-thetaj)) + 2*cos(4*(theta-thetaj)));    
elseif order==5
    k = 1/6*(2*cos(theta-thetaj) + 2*cos(3*(theta-thetaj)) + 2*cos(5*(theta-thetaj)));    
end
end