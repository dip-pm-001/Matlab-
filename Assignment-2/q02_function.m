function [equation, answer] = q02_function()
% sin(3x) dx + 2y*cos(3x)^3 dy = 0, y(pi)=0.
% Dividing by cos(3x)^3 gives: 2y dy = -sin(3x)/cos(3x)^3 dx.
syms x y C
F = int(2*y,y) + int(sin(3*x)/cos(3*x)^3,x);
C0 = solve(subs(F,{x,y},{sym(pi),sym(0)}) == C,C);
equation = simplify(F) == C0;
answer = solve(equation,y);
% No real-valued solution on an open interval about x=pi:
% near pi, y^2 = (1-sec(3*x)^2)/6 < 0 except at x=pi.
% The symbolic answers are complex-valued branches.
end
