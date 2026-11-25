function [equation, answer] = q12_function()
% Definite integral from -4 to -1:
% cube_root(5-2*y) + 7/(5-2*y).
syms y
f=(5-2*y)^(sym(1)/3)+7/(5-2*y);
equation=sym([]);
answer=simplify(int(f,y,-4,-1));
end
