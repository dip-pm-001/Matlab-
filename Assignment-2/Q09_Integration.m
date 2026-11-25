function answer = Q09_Integration()
% Integral [20*exp(2-8*w)*sqrt(1+exp(2-8*w))+7*w^3-6*cuberoot(w)] dw.
syms w
answer = -sym(5)/3*(1+exp(2-8*w))^(sym(3)/2) + ...
         sym(7)/4*w^4 - sym(9)/2*w^(sym(4)/3);
end
