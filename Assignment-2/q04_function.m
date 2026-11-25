function [equation, answer] = q04_function()
% (e^y+1)^2*e^-y dx + (e^x+1)^3*e^-x dy = 0.
% Divide through by the product of both coefficients.
% Then integrate e^x/(1+e^x)^3 dx + e^y/(1+e^y)^2 dy = 0.
syms x y C
I1 = int(exp(x)/(1+exp(x))^3,x);
I2 = int(exp(y)/(1+exp(y))^2,y);
equation = simplify(I1+I2) == C;
% Implicit general solution; also ask solve() for an explicit branch.
answer = solve(equation,y);
if isempty(answer)
    answer = equation;  % Implicit equation is still the full solution.
end
end
