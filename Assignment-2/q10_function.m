function [equation, answer] = q10_function()
% Definite integral from 1 to 2:
% 1/(7*z) + cube_root(z^2)/4 - 1/(2*z^3).
syms z
f=1/(7*z)+(z^2)^(sym(1)/3)/4-1/(2*z^3);
equation=sym([]);
answer=simplify(int(f,z,1,2));
end
