% Assignment 2 — Question 9
% Run this script; it calls the user-defined function q09_function.m.
clear; clc;
[equation, answer] = q09_function();
disp('Question 9');
if ~isempty(equation)
    disp('Equation:'); disp(equation);
end
disp('Solution:'); disp(answer);

