clear all; close all; clc;

x = [-2:0.1:2]; y = [-2:0.1:2];
[X,Y] = meshgrid(x,y);

hill_fc = @(x,y) -(x.^2 + y.^2 - 4);

Z = hill_fc(X,Y);

grafico=mesh(x,y,Z); colormap(hsv);

title('Paraboloide Eliptico - 3D');
xlabel('x','FontSize',14); 
ylabel('y','FontSize',14); 
zlabel('f(x,y)','FontSize',14);
grafico.Parent.FontSize = 14;

hold on
maximos = find(Z>=4);
plot3(X(maximos),Y(maximos),[ 4 ],'s',...
    'MarkerSize',20, 'MarkerEdgeColor','black', ...
    'MarkerFaceColor','black') 
plot3(X(maximos),Y(maximos),[ 4  ],'ob',...
    'MarkerSize',35) 

figure; contourf(x,y,Z); colormap(hsv); hold on
grafico = plot(X(maximos),Y(maximos),'*', 'MarkerSize',15, ...
'MarkerEdgeColor','black', 'MarkerFaceColor','black');
colorbar
title('Paraboloide Eliptico');
xlabel('x','FontSize',14); 
ylabel('y','FontSize',14); 
grafico.Parent.FontSize = 14;

xx = [ 0.5 1.5 1.5];
yy = [ 0.0 1.5 0.0];
triangulo = fill(xx,yy,'k','LineWidth',10);
alpha(triangulo,0.7);
axis('square');

U = zeros(size(X,1),size(Y,1));

for linha = 1:size(X,1)
    for coluna = 1:size(Y,1)
        if X(linha,coluna) <= 1
            if Y(linha,coluna) >= 0
                if Y(linha,coluna) - 1.5*X(linha,coluna) + 0.75 <= 0
                    U(linha,coluna) = Z(linha,coluna);
                end
            end
        end
    end
end

figure;
map = colormap(hsv);
map(1:20,2) = 1;
map(1:20,3) = 1;
map(1:20,1) = 1;
g2 = surf(x,y,U); colormap(map);
title('Paraboloide Eliptico - 3D');
xlabel('x','FontSize',14); 
ylabel('y','FontSize',14); 
zlabel('f(x,y)','FontSize',14);
g2.Parent.FontSize = 14;

figure; contourf(x,y,U); colormap(hot); hold on
title('Paraboloide Eliptico - 3D');
xlabel('x','FontSize',14); 
ylabel('y','FontSize',14); 
zlabel('f(x,y)','FontSize',14);
grafico.Parent.FontSize = 14;

