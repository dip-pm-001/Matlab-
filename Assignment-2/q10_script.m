% Assignment 2 — Question 10
% Run this script; it calls the user-defined function q10_function.m.
clear; clc;
[equation, answer] = q10_function();
disp('Question 10');
if ~isempty(equation)
    disp('Equation:'); disp(equation);
end
disp('Solution:'); disp(answer);

