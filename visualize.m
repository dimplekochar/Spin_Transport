%visualize results
%clear;
%psit = load("psit20.mat");
%psit = psit.psit;
L = 1e-6;
x = linspace(0,L,m);
y = linspace(0,L,m);
[X,Y] = meshgrid(x,y);
figure(1);
pause(2);
for i=300001:round(steps/1000):steps
Z = [uinj; psit(1:N,i)];
ZZ = reshape(Z,[m,m]);
surf(X,Y,log10(abs(ZZ)));
pbaspect([1 1 1])
shading interp
xlabel("y (m)")
ylabel("x (m)")
view(90, -90);
hh = colorbar;
set(get(hh,'label'),'string','log_{10}(\mu)');
lim = caxis;
caxis([-12 -4]);
title("t="+tt(i)+"s")
pause(0.25);
end