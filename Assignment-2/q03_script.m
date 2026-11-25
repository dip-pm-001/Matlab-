% Assignment 2 — Question 3
% Run this script; it calls the user-defined function in q03_function.m.
clear; clc;
[equation, answer] = q03_function();
disp('Question 3:');
if ~isempty(equation)
    disp('Equation / intermediate result:');
    disp(equation);
end
disp('Solution:');
disp(answer);

