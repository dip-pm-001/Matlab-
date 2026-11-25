function [equation, answer] = q03_function()
% sqrt(1-y^2) dx - sqrt(1-x^2) dy = 0;
% y(0)=sqrt(3)/2. Separation gives dy/sqrt(1-y^2)=dx/sqrt(1-x^2).
syms x y C
F = int(1/sqrt(1-y^2),y) - int(1/sqrt(1-x^2),x);
C0 = solve(subs(F,{x,y},{sym(0),sqrt(sym(3))/2}) == C,C);
equation = F == C0;
answer = sin(asin(x)+C0);
% Relevant real branch through x=0 holds locally while x<=1/2.
end
