% Assignment 2 — Question 7
% Run this script; it calls the user-defined function q07_function.m.
clear; clc;
[equation, answer] = q07_function();
disp('Question 7');
if ~isempty(equation)
    disp('Equation:'); disp(equation);
end
disp('Solution:'); disp(answer);

