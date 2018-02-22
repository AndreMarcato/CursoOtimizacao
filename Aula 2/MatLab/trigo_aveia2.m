clear all; close all; clc;

grafico = figure;

axis([0, 100, 0, 100]);
axis('square');
grafico.CurrentAxes.FontSize = 14;
grafico.CurrentAxes.FontWeight = 'bold';
grafico.Position = [1000 537 885 801 ];
xlabel('x_1 - area cereal tipo A','FontSize',16);
ylabel('x_2 - area cereal tipo B','FontSize',16);
title('Solucao Grafica Problema Cereais','FontSize',16);
hold on; grid on;

x1 = [0:0.01:100]; x2 = [0:0.1:100];

reta_FOB = @(x,z) -(600/800)*x + (1/800)*z;

contador = 0;
for Z = 40000:10000:120000
    linha = plot(x1,reta_FOB(x1,Z),'-r','LineWidth',6);

    pos_y = reta_FOB(0,Z);
    if pos_y <= 100
        pos_x = 0;
    else
        pos_y = 100;
        pos_x = (Z - 800*100)/600;
    end

    Texto = [ 'Z =' num2str(Z) '= 600*x_1 + 800*x_2' ];
    escreve = text(pos_x+2.5,pos_y-5.5,Texto,'FontSize',20,'FontWeigh','Bold');

    escreve.Rotation = -(600/800)*180/pi+5;
    drawnow;    
    frame = getframe(grafico);
    im = frame2im(frame);
    contador = contador + 1;
    nome = [ 'anima_' num2str(contador) '.png' ];
    imwrite(im,nome,'JPG');
    linha.delete;
    escreve.delete;
end





