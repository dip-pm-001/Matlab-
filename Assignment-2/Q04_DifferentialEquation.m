function answer = Q04_DifferentialEquation()
% (exp(y)+1)^2*exp(-y) dx + (exp(x)+1)^3*exp(-x) dy = 0.
% Separate exp(x)/(1+exp(x))^3 dx + exp(y)/(1+exp(y))^2 dy = 0.
syms x y C
answer = 1/(2*(1+exp(x))^2) + 1/(1+exp(y)) == C;
end
