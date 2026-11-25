function answer = Q03_DifferentialEquation()
% sqrt(1-y^2) dx - sqrt(1-x^2) dy=0, y(0)=sqrt(3)/2.
% Principal local solution near x=0.
syms x
answer = sin(asin(x) + sym(pi)/3);
end
