clear all; close all; clc;

c = -[ 600 800];

A = [ 1 1; 1 2; 1 0; 0 1];
B = [ 100; 240; 60; 80];
lb = [0 0];
ub = [inf inf];

[x, fval, exitflag] = linprog(c,A,B,[],[],lb,ub)