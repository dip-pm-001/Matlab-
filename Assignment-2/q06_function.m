function [equation, answer] = q06_function()
% Integral of 6*cos(z) + 4/sqrt(1-z^2) with respect to z.
syms z C
f = 6*cos(z) + 4/sqrt(1-z^2);
equation = sym([]);
answer = int(f,z) + C;
end
