clear all; close all; clc;

c = -[-2 1 1 -3 1];
A = [-1 -2 1 -1 -3; 4 0 1 -2 -1; 0 0 2 -1 -2];
B = [-5; 0 ; 7];
Aeq = [3 1 0 -1 1];
Beq = 8;
LB = [0     0 -inf -inf   0]; 
UB = [inf inf    0 inf  inf];

[x,fval, exitflag] = linprog(c,A,B,Aeq,Beq,LB,UB)


clear all; close all; clc;

c = -[-2 1 -1 -3 +3 1 0 0 0];
A = [];
B = [];
Aeq = [ ...
        1 2  1  1 -1  3 -1 0 0; ...
        4 0 -1  2  2 -1  0 1 0; ...
        0 0 -2 -1  1 -2  0 0 1; ...
        3 1  0 -1  1  1  0 0 0; ...
      ];
Beq = [ 5; 0; 7; 8];
LB =  [  0  0  0  0  0  0    0   0]; 
UB =  [inf inf  inf  0 inf inf inf];

[x,fval, exitflag] = linprog(c,A,B,Aeq,Beq,LB,UB)