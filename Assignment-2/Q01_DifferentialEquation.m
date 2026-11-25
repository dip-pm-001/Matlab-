function answer = Q01_DifferentialEquation()
% e^x*y*dy/dx = e^(-y)+e^(-2*x-y)
% General solution is implicit.
syms x y C
answer = exp(y)*(y-1) == -exp(-x)-exp(-3*x)/3+C;
end
