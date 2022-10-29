cl =[87.00*1e3
980.4
11.05
124.5*1e-3
1.420*1e-3
980.4
21.85
366.6*1e-3
5.473*1e-3
77.67*1e-6
11.05
366.6*1e-3
8.170*1e-3
152.0*1e-6
2.588*1e-6
124.5*1e-3
5.473*1e-3
152.0*1e-6
3.389*1e-6
67.34*1e-9
1.420*1e-3
77.67*1e-6
2.588*1e-6
67.34*1e-9
1.534*1e-9];
L = 1e-6;
m = 5;
N = 25;
x = linspace(0,L,m);
y = linspace(0,L,m);
[X,Y] = meshgrid(x,y);
figure(2);

Z = cl;
ZZ = reshape(Z,[m,m]);
surf(X,Y,log10(abs(ZZ)));
shading interp
pbaspect([1 1 1])
xlabel("y (m)")
ylabel("x (m)")
view(90, -90);
hh = colorbar;
set(get(hh,'label'),'string','log_{10}(\mu)');
lim = caxis;
caxis([-9 5]);
title("circuit lab - steady state")