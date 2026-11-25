% Assignment 2 — Question 11
% Run this script; it calls the user-defined function q11_function.m.
clear; clc;
[equation, answer] = q11_function();
disp('Question 11');
if ~isempty(equation)
    disp('Equation:'); disp(equation);
end
disp('Solution:'); disp(answer);

