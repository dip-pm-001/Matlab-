% Assignment 2 — Question 5
% Run this script; it calls the user-defined function in q05_function.m.
clear; clc;
[equation, answer] = q05_function();
disp('Question 5:');
if ~isempty(equation)
    disp('Equation / intermediate result:');
    disp(equation);
end
disp('Solution:');
disp(answer);

