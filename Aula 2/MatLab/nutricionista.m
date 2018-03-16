clear all; close all; clc;

% FOB
f = [ 3 2];
% Restricoes de desigualdade
A = [-2 -1; -6 -1; -1 -3];
% Termos constantes 
b = [-8; -12; -9];
% Restricoes de Igualdade
Aeq = []; beq = [];
% Restricoes de Canalizacao
LB = [ 0 0]; UB = [inf inf];
% Resolucao
[X, FVAL, EXITFLAG] = linprog(f,A,b,Aeq,beq,LB,UB)