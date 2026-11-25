function [equation, answer] = q07_function()
% Integral of (x^4 - cube_root(x))/(6*sqrt(x)) dx.
syms x C
f=(x^4-x^(sym(1)/3))/(6*sqrt(x));
equation=sym([]);
answer=int(f,x)+C;
end
