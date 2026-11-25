% Assignment 2 — Question 2
% Run this script; it calls the user-defined function in q02_function.m.
clear; clc;
[equation, answer] = q02_function();
disp('Question 2:');
if ~isempty(equation)
    disp('Equation / intermediate result:');
    disp(equation);
end
disp('Solution:');
disp(answer);
disp('Note: No real solution on an open interval around x = pi.');
