% IT Workshop Assignment 2: call user-defined MATLAB functions.
% Save ALL Qxx_*.m files in the same folder, or add folder to MATLAB path.
% Requires Symbolic Math Toolbox.
clear; clc;
for q=1:12
    fprintf('Question %02d:\n',q);
    switch q
        case 1, result=Q01_DifferentialEquation();
        case 2, result=Q02_DifferentialEquation();
        case 3, result=Q03_DifferentialEquation();
        case 4, result=Q04_DifferentialEquation();
        case 5, result=Q05_DifferentialEquation();
        case 6, result=Q06_Integration();
        case 7, result=Q07_Integration();
        case 8, result=Q08_Integration();
        case 9, result=Q09_Integration();
        case 10, result=Q10_DefiniteIntegration();
        case 11, result=Q11_DefiniteIntegration();
        case 12, result=Q12_DefiniteIntegration();
    end
    disp(result);
end
