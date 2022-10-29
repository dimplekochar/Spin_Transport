function xl = trapezoidal(eval_f, xl_1, delt, N,u,A,b)
    gamma = xl_1+(delt*(feval(eval_f,xl_1,u,N,A,b)+(b*u))/2);
    
    %xl = newtonNd(eval_f, xg,N,p,u,errf,errDeltapsi,relDeltapsi,MaxIter,eval_Jf,gamma,delt,dxFD);
    xl = (eye(N)-(delt*A/2))\gamma;
end