clear all; close all; clc;
M = 60;
c = -[2 3 0 0 -M -M];
A = []; B=[];
Aeq = [ -2 3  1 0 0 0; 1 2 0 -1 1 0; 1 1 0 0 0 1];
Beq = [ 6;8;6 ];
lb = [  0   0   0   0   0   0];
ub = [inf inf inf inf inf inf];
[x, fval, exitflag] = linprog(c,A,B,Aeq,Beq, lb, ub)
