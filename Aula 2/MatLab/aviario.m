clear all; close all; clc;

grafico = figure;

axis([0, 90, 0, 90]);
axis('square');
grafico.CurrentAxes.FontSize = 25;
grafico.CurrentAxes.FontWeight = 'bold';
grafico.Position = [1000 537 885 801 ];
xlabel('x_M - Quantidade Milho (kg)','FontSize',25);
ylabel('x_F - Quantidade Farelo Arroz (kg)','FontSize',25);
title('Solução Gráfica Problema Aviario','FontSize',25);
hold on; grid on;

x1 = [0:0.01:90]; x2 = [0:0.01:90];

reta_FOB = @(x,z) -3*x + (1/0.3)*z;

contador = 0;
for Z = 9:9:81
    linha = plot(x1,reta_FOB(x1,Z),'-r','LineWidth',6);

    pos_y = reta_FOB(0,Z);
    if pos_y <= 90
        pos_x = 0;
    else
        pos_y = 90;
        pos_x = (Z - 0.3*90)/0.9;
    end

    Texto = [ 'Z =' num2str(Z) '= 0.9*x_M + 0.3*x_F' ];
    escreve = text(pos_x+4.5,pos_y-5.5,Texto,'FontSize',30, ...
                                             'FontWeigh','Bold', ...
                                             'Color', 'red');

    escreve.Rotation = -71;
    drawnow;    
    frame = getframe(grafico);
    im = frame2im(frame);
    contador = contador + 1;
    nome = [ 'aviario_' num2str(contador) '.png' ];
    imwrite(im,nome,'JPG');
    if Z ~= 81
        linha.delete;
        escreve.delete;
    end
end

reta_R1 = @(x,z) -x + 90;

linhaR1 = plot(x1,reta_R1(x1,Z),'-b','LineWidth',6);

drawnow;    
frame = getframe(grafico);
im = frame2im(frame);
contador = contador + 1;
nome = [ 'aviario_' num2str(contador) '.png' ];
imwrite(im,nome,'JPG');


reta_R2 = @(x,z) x ;

linhaR2 = plot(x1,reta_R2(x1,Z),'-g','LineWidth',6);

xx = [ 0 90 90];
yy = [ 0 90 0];
triangulo = fill(xx,yy,'-g','LineWidth',1);
alpha(triangulo,0.5);
frame = getframe(grafico);
im = frame2im(frame);
contador = contador + 1;
nome = [ 'aviario_' num2str(contador) '.png' ];
imwrite(im,nome,'JPG');

reta_R3 = @(x,z) (1/3)*x ;

linhaR3 = plot(x1,reta_R3(x1,Z),'-m','LineWidth',6);

xx = [ 0 90 90 0];
yy = [ 0 30 90 90];
triangulo = fill(xx,yy,'-m','LineWidth',1);
alpha(triangulo,0.3);
frame = getframe(grafico);
im = frame2im(frame);
contador = contador + 1;
nome = [ 'aviario_' num2str(contador) '.png' ];
imwrite(im,nome,'JPG');

otimos = [ 81 72 63 54 ];

for i = 1:4
    linha.delete;
    escreve.delete;

    Z = otimos(i);
    linha = plot(x1,reta_FOB(x1,Z),'-r','LineWidth',6);

    pos_y = reta_FOB(0,Z);
    if pos_y <= 90
        pos_x = 0;
    else
        pos_y = 90;
        pos_x = (Z - 0.3*90)/0.9;
    end

    Texto = [ 'Z =' num2str(Z) '= 0.9*x_M + 0.3*x_F' ];
    escreve = text(pos_x+4.5,pos_y-5.5,Texto,'FontSize',30, ...
                                             'FontWeigh','Bold', ...
                                             'Color', 'black');

    escreve.Rotation = -71;
    drawnow;    
    frame = getframe(grafico);
    im = frame2im(frame);
    contador = contador + 1;
    nome = [ 'aviario_' num2str(contador) '.png' ];
    imwrite(im,nome,'JPG');

end

plot(45,45,'o','LineWidth',25)

drawnow;    
frame = getframe(grafico);
im = frame2im(frame);
contador = contador + 1;
nome = [ 'aviario_' num2str(contador) '.png' ];
imwrite(im,nome,'JPG');

clear all; close all; clc;
f = [0.9 0.3]; A = [-0.02 0.02;0.01 -0.03]; B = [ 0; 0];
Aeq = [ 1 1 ]; Beq = 90;
[x, fval] = linprog(f,A,B,Aeq,Beq)
