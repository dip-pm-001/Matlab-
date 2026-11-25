function [equation, answer] = q05_function()
% x*sqrt(1+y^2) dx = y*sqrt(1+x^2) dy; y(1)=10.
% Divide by sqrt(1+x^2)*sqrt(1+y^2) and integrate.
syms x y C
F = int(x/sqrt(1+x^2),x) - int(y/sqrt(1+y^2),y);
C0 = solve(subs(F,{x,y},{sym(1),sym(10)}) == C,C);
equation = F == C0;
% The initial value selects the positive branch of the square root.
A = sqrt(1+x^2)-C0;
branches = solve(1+y^2 == A^2,y);
answer = sqrt(A^2-1);
% branches contains +/- roots; only + satisfies y(1)=10.
end
