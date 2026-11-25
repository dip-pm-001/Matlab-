% Assignment 2 — Question 1
% Run this script; it calls the user-defined function in q01_function.m.
clear; clc;
[equation, answer] = q01_function();
disp('Question 1:');
if ~isempty(equation)
    disp('Equation / intermediate result:');
    disp(equation);
end
disp('Solution:');
disp(answer);

