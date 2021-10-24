
clc;clear;close;
[x,y]=meshgrid(linspace(-2,2));
h=streamslice(x,y,y-x.*(x.^2+y.^2-1),-x-y.*(x.^2+y.^2-1));
title('Limit Circle')
xlabel('x','Color',[0.6 0.5 0.4]);ylabel('y','Color',[0.6 0.5 0.4]);
xlim([-2,2]);ylim([-2,2]);
set(h,'Color','k')
axis equal
hold on
theta=0:pi/30:2*pi;
x1=cos(theta);y1=sin(theta);
plot(x1,y1,'r--')
