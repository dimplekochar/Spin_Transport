function xl = trapezoidal(eval_f, xl_1, delt, N,u,A,b,L,U,P)
    gamma = xl_1+(delt*(feval(eval_f,xl_1,u,N,A,b)+(b*u))/2);
    y = L\(P*gamma);
    xl = U\y; 
%    xl = (eye(N)-(delt*A/2))\gamma;
end