function answer = Q07_Integration()
% Integral [(x^4 - cuberoot(x))/(6*sqrt(x))] dx, x>0.
syms x positive
answer = simplify(int((x^4-x^(sym(1)/3))/(6*sqrt(x)),x));
end
