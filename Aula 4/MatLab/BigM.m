clear all; close all; clc;
c = -[2 3];
A = [ -2 3 ; -1 -2 ];
B = [ 6 ; -8 ];
Aeq = [ 1 1 ];
Beq = [ 6 ];
[x, fval, exitflag] = linprog(c,A,B,Aeq,Beq)

