function [A, b] = getAb(p, N)    
roe = p(1);
    L = p(2);
    lsf = p(3);
    tsf = p(4);
    q = 1.6*10^-19; %charge
    hb = 1.05*10^-34; %hbar
    delL = L/N;
    C = hb*tsf/(4*q*roe*L);
    R1 = 4*q*roe*delL/hb;
    R2 = 4*q*roe*lsf^2/(hb*delL);
    m = sqrt(N+1);
Q = zeros(N);
A = zeros(N);
b = zeros([N, 1]);
A(1,1) = (3/(R1*C))+(1/(C*R2));
A(1,2) = (-1/(R1*C));
A(1,1+m) = (-1/(R1*C));
Q(1,1) = -3;
Q(1,2) = 1;
Q(1,1+m) = 1;
A(m,m) = (3/(R1*C))+(1/(C*R2));
A(m,m+1) = (-1/(R1*C));
A(m,m+m) = (-1/(R1*C));
Q(m,m) = -3;
Q(m,m+1) = 1;
Q(m,m+m) = 1;
for i=2:N
    if i==m
        continue;
    end
    if mod(i, m)~=0
        A(i,i) = A(i,i)+(1/(C*R1));
        A(i,i-1) = A(i,i-1)-(1/(C*R1));
        Q(i,i) = Q(i,i)-1;
        Q(i,i-1) = Q(i,i-1)+1;
    end
    if ~(i>=1 && i<m)
        A(i,i) = A(i,i)+(1/(C*R1));
        A(i,i-m) = A(i,i-m)-(1/(C*R1));
        Q(i,i) = Q(i,i)-1;
        Q(i,i-m) = Q(i,i-m)+1;
    end
    if mod(i+1, m) ~= 0 
        A(i,i) = A(i,i)+(1/(C*R1));
        A(i,i+1) = A(i,i+1)-(1/(C*R1));
        Q(i,i) = Q(i,i)-1;
        Q(i,i+1) = Q(i,i+1)+1;
    end
    if ~(i>= m^2-m && i<m^2)
        A(i,i) = A(i,i)+(1/(C*R1));
        A(i,i+m) = A(i,i+m)-(1/(C*R1));
        Q(i,i) = Q(i,i)-1;
        Q(i,i+m) = Q(i,i+m)+1;
    end
    A(i,i) = A(i,i)+(1/(C*R2));
end
    b(1) = -1/(R1*C);
    b(m) = -1/(R1*C);
    A = Q\A;
    b = Q\b;