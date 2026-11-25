% Assignment 2 — Question 4
% Run this script; it calls the user-defined function in q04_function.m.
clear; clc;
[equation, answer] = q04_function();
disp('Question 4:');
if ~isempty(equation)
    disp('Equation / intermediate result:');
    disp(equation);
end
disp('Solution:');
disp(answer);

