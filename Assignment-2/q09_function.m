function [equation, answer] = q09_function()
% Integral of 20*exp(2-8*w)*sqrt(1+exp(2-8*w))
%             + 7*w^3 - 6*cube_root(w) dw.
syms w C
f=20*exp(2-8*w)*sqrt(1+exp(2-8*w)) ...
    +7*w^3-6*w^(sym(1)/3);
equation=sym([]);
answer=int(f,w)+C;
end
