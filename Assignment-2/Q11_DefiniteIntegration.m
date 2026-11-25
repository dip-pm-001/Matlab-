function answer = Q11_DefiniteIntegration()
% Integral -2 to 1: (2-z)^3 + sin(pi*z)*(3+2*cos(pi*z))^3.
syms z real
f = (2-z)^3+sin(sym(pi)*z)*(3+2*cos(sym(pi)*z))^3;
answer = simplify(int(f,z,-2,1));
end
