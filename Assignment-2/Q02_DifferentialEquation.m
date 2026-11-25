function answer = Q02_DifferentialEquation()
% sin(3*x) dx + 2*y*cos(3*x)^3 dy = 0, y(pi)=0.
% Formal implicit curve. No real differentiable IVP solution around x=pi.
syms x y
F = y^2 + 1/(6*cos(3*x)^2);
C = simplify(subs(F,{x,y},{sym(pi),sym(0)}));
answer = F == C;
end
