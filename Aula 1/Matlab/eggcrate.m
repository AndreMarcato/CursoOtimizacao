clear all; close all; clc;

x = [-6:0.1:6]; y = [-6:0.1:6];
[X,Y] = meshgrid(x,y);

egg_crate = @(x,y) x.^2 + y.^2 ...
    + 25*( sin(x).^2 + sin(y).^2 );

Z = egg_crate(X,Y);

grafico=mesh(x,y,Z); colormap(hsv);

title('Eggcrate Function - 3D');
xlabel('x','FontSize',14); 
ylabel('y','FontSize',14); 
zlabel('f(x,y)','FontSize',14);
grafico.Parent.FontSize = 14;

hold on
maximos = find(Z>96.2);
plot3(X(maximos),Y(maximos),[ 96.2 96.2 96.2 96.2 ],'s',...
    'MarkerSize',20, 'MarkerEdgeColor','black', ...
    'MarkerFaceColor','black') 
plot3(X(maximos),Y(maximos),[ 96.2 96.2 96.2 96.2 ],'ob',...
    'MarkerSize',35) 

figure; contourf(x,y,Z); colormap(hsv); hold on
grafico = plot(X(maximos),Y(maximos),'*', 'MarkerSize',15, ...
'MarkerEdgeColor','black', 'MarkerFaceColor','black')
colorbar
title('Eggcrate Function');
xlabel('x','FontSize',14); 
ylabel('y','FontSize',14); 
grafico.Parent.FontSize = 14;


