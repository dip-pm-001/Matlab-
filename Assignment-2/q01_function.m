function [equation, answer] = q01_function()
% e^x*y*dy/dx = e^(-y) + e^(-2*x-y).
% Separable: y*e^y dy = (e^-x + e^-3x) dx.
syms x y C
L = int(y*exp(y),y);
R = int(exp(-x)+exp(-3*x),x);
equation = L-R == C;
% Solve explicitly for y (Lambert W is the inverse of u*exp(u)).
answer = 1 + lambertw((C - exp(-x) - exp(-3*x)/3)/exp(sym(1)));
% The equality in 'equation' is the general implicit solution.
end
