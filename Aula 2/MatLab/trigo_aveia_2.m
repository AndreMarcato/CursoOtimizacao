clear all; close all; clc;

f = [-600 -800];
A = [1 1; 3 2];
b = [100; 240];
Aeq=[]; beq=[];
LB=[0 0]; UB=[60 80];

[x, fval, exitflag] = linprog(f,A,b,Aeq,beq,LB,UB)





