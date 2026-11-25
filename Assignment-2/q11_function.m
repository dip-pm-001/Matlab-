function [equation, answer] = q11_function()
% Definite integral from -2 to 1:
% (2-z)^3 + sin(pi*z)*(3+2*cos(pi*z))^3.
syms z
f=(2-z)^3+sin(sym(pi)*z)*(3+2*cos(sym(pi)*z))^3;
equation=sym([]);
answer=simplify(int(f,z,-2,1));
end
