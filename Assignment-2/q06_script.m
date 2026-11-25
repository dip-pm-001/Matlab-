% Assignment 2 — Question 6
% Run this script; it calls the user-defined function in q06_function.m.
clear; clc;
[equation, answer] = q06_function();
disp('Question 6:');
if ~isempty(equation)
    disp('Equation / intermediate result:');
    disp(equation);
end
disp('Solution:');
disp(answer);

