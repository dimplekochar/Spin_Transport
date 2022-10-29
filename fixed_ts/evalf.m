function f = evalf(x,u,N, A, b)
    % p = [roe L lsf tsf] 
    %       roe: charge resistivity 
    %       L: length
    %       lsf: spin diffusion length
    %       tsf: spin relaxation time
    % x = [mu1 mu2 mu3 ... muN]
    % u = [const]
    %Q*x' = AA*x + BB*u
    %  x' = Ax + Bu, with A = Q^-1*AA and B = Q^-1*BB
    
    f = (A*x)+(b*u);
end
