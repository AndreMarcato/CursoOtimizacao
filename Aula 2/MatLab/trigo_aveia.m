clear all; close all; clc;

grafico = figure;

axis([0, 100, 0, 100]);
axis('square');
grafico.CurrentAxes.FontSize = 25;
grafico.CurrentAxes.FontWeight = 'bold';
grafico.Position = [1000 537 885 801 ];
xlabel('x_1 - Área cereal tipo A','FontSize',25);
ylabel('x_2 - Área cereal tipo B','FontSize',25);
title('Solução Gráfica Problema Cereais','FontSize',25);
hold on; grid on;

x1 = [0:0.01:100]; x2 = [0:0.01:100];

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
    escreve = text(pos_x+2.5,pos_y-5.5,Texto,'FontSize',30, ...
                                             'FontWeigh','Bold', ...
                                             'Color', 'red');

    escreve.Rotation = -(600/800)*180/pi+5;
    drawnow;    
    frame = getframe(grafico);
    im = frame2im(frame);
    contador = contador + 1;
    nome = [ 'anima_' num2str(contador) '.png' ];
    imwrite(im,nome,'JPG');
    if Z ~= 120000
        linha.delete;
        escreve.delete;
    end
end

reta_R1 = @(x,z) -x + 100;

linhaR1 = plot(x1,reta_R1(x1,Z),'-b','LineWidth',6);

xx = [ 0 0 100];
yy = [ 0 100 0];
triangulo = fill(xx,yy,'-b','LineWidth',1);
alpha(triangulo,0.5);
frame = getframe(grafico);
im = frame2im(frame);
contador = contador + 1;
nome = [ 'anima_' num2str(contador) '.png' ];
imwrite(im,nome,'JPG');

reta_R2 = @(x,z) -1.5*x + 120;

linhaR2 = plot(x1,reta_R2(x1,Z),'-g','LineWidth',6);

xx = [ 0 0 40/3 80];
yy = [ 0 100 100 0];
triangulo = fill(xx,yy,'-g','LineWidth',1);
alpha(triangulo,0.5);
frame = getframe(grafico);
im = frame2im(frame);
contador = contador + 1;
nome = [ 'anima_' num2str(contador) '.png' ];
imwrite(im,nome,'JPG');

xx = [ 0 0 40 80];
yy = [ 0 100 60 0];
triangulo = fill(xx,yy,'-m','LineWidth',1);
alpha(triangulo,0.8);
escreve2 = text(15,30,'Região Viável','FontSize',30, ...
                                    'FontWeigh','Bold', ...
                                    'Color', 'white');
frame = getframe(grafico);
im = frame2im(frame);
contador = contador + 1;
nome = [ 'anima_' num2str(contador) '.png' ];
imwrite(im,nome,'JPG');

triangulo.delete;
escreve2.delete;

reta_R3 = @(x,z) 80;
reta_R4 = @(x,z) 60;

linhaR3 = plot(x1,80*ones(1,size(x1,2)),'-k','LineWidth',6);
linhaR4 = plot(60*ones(1,size(x1,2)),x2,'-k','LineWidth',6);

xx = [ 0 0 60 60];
yy = [ 0 80 80 0];
triangulo = fill(xx,yy,'-k','LineWidth',1);
alpha(triangulo,0.5);
frame = getframe(grafico);
im = frame2im(frame);
contador = contador + 1;
nome = [ 'anima_' num2str(contador) '.png' ];
imwrite(im,nome,'JPG');


xx = [ 0 0 20 40 60 60];
yy = [ 0 80 80 60 30 0];
triangulo = fill(xx,yy,'-m','LineWidth',1);
alpha(triangulo,0.8);
escreve2 = text(15,30,'Região Viável','FontSize',30, ...
                                    'FontWeigh','Bold', ...
                                    'Color', 'white');
frame = getframe(grafico);
im = frame2im(frame);
contador = contador + 1;
nome = [ 'anima_' num2str(contador) '.png' ];
imwrite(im,nome,'JPG');

otimos = [ 36000 60000 72000 76000 ];

for i = 1:4
    linha.delete;
    escreve.delete;

    Z = otimos(i);
    linha = plot(x1,reta_FOB(x1,Z),'-r','LineWidth',6);

    pos_y = reta_FOB(0,Z);
    if pos_y <= 100
        pos_x = 0;
    else
        pos_y = 100;
        pos_x = (Z - 800*100)/600;
    end

    Texto = [ 'Z =' num2str(Z) '= 600*x_1 + 800*x_2' ];
    escreve = text(pos_x+2.5,pos_y-5.5,Texto,'FontSize',30, ...
                                             'FontWeigh','Bold', ...
                                             'Color', 'black');

    escreve.Rotation = -(600/800)*180/pi+5;
    drawnow;    
    frame = getframe(grafico);
    im = frame2im(frame);
    contador = contador + 1;
    nome = [ 'anima_' num2str(contador) '.png' ];
    imwrite(im,nome,'JPG');

end

plot(20,80,'o','LineWidth',25)

otimos = [ 36000 60000 72000 76000 ];

grad_x = [30 45 54 60 ];
grad_y = [40 60 72 80 ];

for i = 1:4
    linha.delete;
    escreve.delete;

    Z = otimos(i);
    linha = plot(x1,reta_FOB(x1,Z),'-r','LineWidth',6);

    pos_y = reta_FOB(0,Z);
    if pos_y <= 100
        pos_x = 0;
    else
        pos_y = 100;
        pos_x = (Z - 800*100)/600;
    end

    Texto = [ 'Z =' num2str(Z) '= 600*x_1 + 800*x_2' ];
    escreve = text(pos_x+2.5,pos_y-5.5,Texto,'FontSize',30, ...
                                             'FontWeigh','Bold', ...
                                             'Color', 'black');

    escreve.Rotation = -(600/800)*180/pi+5;
    gradiente = quiver(0,0,grad_x(i),grad_y(i), 'Color', 'cyan', 'LineWidth',5)
    drawnow;    
    frame = getframe(grafico);
    im = frame2im(frame);
    contador = contador + 1;
    nome = [ 'anima_' num2str(contador) '.png' ];
    imwrite(im,nome,'JPG');
    gradiente.delete;

end

