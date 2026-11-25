function answer = Q05_DifferentialEquation()
% x*sqrt(1+y^2) dx = y*sqrt(1+x^2) dy; y(1)=10.
% Positive local solution.
syms x
C = sqrt(sym(2))-sqrt(sym(101));
answer = sqrt((sqrt(1+x^2)-C)^2-1);
end
