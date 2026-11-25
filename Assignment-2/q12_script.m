% Assignment 2 — Question 12
% Run this script; it calls the user-defined function q12_function.m.
clear; clc;
[equation, answer] = q12_function();
disp('Question 12');
if ~isempty(equation)
    disp('Equation:'); disp(equation);
end
disp('Solution:'); disp(answer);

