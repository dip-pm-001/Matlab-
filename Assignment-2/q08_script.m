% Assignment 2 — Question 8
% Run this script; it calls the user-defined function q08_function.m.
clear; clc;
[equation, answer] = q08_function();
disp('Question 8');
if ~isempty(equation)
    disp('Equation:'); disp(equation);
end
disp('Solution:'); disp(answer);

