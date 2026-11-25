function answer = Q10_DefiniteIntegration()
% Integral 1 to 2: 1/(7*z) + cuberoot(z^2)/4 - 1/(2*z^3).
syms z positive
f = 1/(7*z) + z^(sym(2)/3)/4 - 1/(2*z^3);
answer = simplify(int(f,z,1,2));
end
