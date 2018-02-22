clear all; close all; clc;

x = [-4:0.04:4]; y = [-4:0.04:4];
[X,Y] = meshgrid(x,y);

ackley_fc = @(x,y) -20*exp(-0.2*sqrt(  0.5*(x.^2+y.^2) )) ...
                 -exp(0.5*(cos(2*pi*x) + cos(2*pi*y))) ...
                 +exp(1)+20;

Z = ackley_fc(X,Y);

grafico=mesh(x,y,Z); colormap(hsv);

title('Ackley Function - 3D', 'FontSize',14);
xlabel('x','FontSize',14); 
ylabel('y','FontSize',14); 
zlabel('f(x,y)','FontSize',14);
grafico.Parent.FontSize = 14;

figure; 
contourf(x,y,Z); colormap(hsv); hold on
colorbar
title('Ackley Function', 'FontSize',14);
xlabel('x','FontSize',14); 
ylabel('y','FontSize',14); 
grafico.Parent.FontSize = 14;

