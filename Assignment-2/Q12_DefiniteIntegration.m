function answer = Q12_DefiniteIntegration()
% Integral -4 to -1: cuberoot(5-2*y)+7/(5-2*y).
syms y real
f = (5-2*y)^(sym(1)/3)+7/(5-2*y);
answer = simplify(int(f,y,-4,-1));
end
