clear;
m = 20;
N = m^2-1;
delt = 1e-18;
tt = 1e-15:delt:4e-13;
steps = size(tt);
steps = steps(2);
xi = zeros([N, 1]);
roe = 2.3*10^-8;
L = 1e-6;
lsf = 4.5*10^-9;
tsf = 4.0*10^-11;
uinj = 8.7e-6;
p = [roe L lsf tsf];
u = uinj;
%[t, y] = ode45(@(t,xi) evalf(tspan,xi,p,u,N),tspan,xi);
eval_f = 'evalf';
%y = ForwardEuler(eval_f, xi, p, u,tspan(1),tspan(2),1e-17,1,N); %1e-16 ok too


%%%%%

x_start = xi;
xl_1 = x_start;
k=1;
psit(1:N, 1) = x_start;
[A, b] = getAb(p, N); 
%steps = tfinal/delt;
J = eye(N)-(delt*A/2);
[L, U, P] = lu(J);
for i=1:steps-1
xl = trapezoidal(eval_f, xl_1, delt, N,u,A,b,L,U,P);
xl_1 = xl;
psit(1:N,i+1) = xl;
end
visualize;
%visualize results
% x = linspace(0,L,m);
% y = linspace(0,L,m);
% [X,Y] = meshgrid(x,y);
% for i=1:round(steps/100):steps
% Z = [uinj; psit(1:N,i)];
% ZZ = reshape(Z,[m,m]);
% surf(X,Y,log10(abs(ZZ)));
% shading interp
% view(90, -90);
% colorbar;
% lim = caxis;
% caxis([-16 -4]);
% title("t="+tt(i)+"s")
% pause(0.33);
% end