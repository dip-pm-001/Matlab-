# IT Workshop Practical — Assignment 2

This assignment has 12 problems: five differential equations and seven integrals.

The provided PDF requires a **user-defined function called from a script** rather than App Designer button callbacks. Each problem has its own MATLAB .m function file, and `run_all_assignment2.m` calls all 12 functions.

## Run

1. Put all 13 MATLAB .m files in one folder.
2. Ensure **Symbolic Math Toolbox** is available.
3. Run `run_all_assignment2.m`.

The results from indefinite integration omit arbitrary +C in code; add +C when writing general antiderivatives.

## Expected mathematical results

1. exp(y)*(y-1) = -exp(-x) - exp(-3*x)/3 + C.
2. y^2 + 1/(6*cos(3*x)^2) = 1/6 (formal implicit expression). **The specified condition y(pi)=0 has no real differentiable solution on an open interval around x=pi.**
3. y = sin(asin(x)+pi/3), locally near x=0.
4. 1/(2*(1+exp(x))^2) + 1/(1+exp(y)) = C.
5. y = sqrt((sqrt(1+x^2)-sqrt(2)+sqrt(101))^2-1), near x=1.
6. 6*sin(z)+4*asin(z)+C.
7. x^(9/2)/27 - x^(5/6)/5 + C (for x>0).
8. exp(1+tan(v))+C.
9. -(5/3)*(1+exp(2-8*w))^(3/2)+(7/4)*w^4-(9/2)*w^(4/3)+C, on w>=0.
10. -27/80 + log(2)/7 + 3*2^(2/3)/10; approximately 0.23774134.
11. 255/4 + 78/pi; approximately 88.57817112.
12. 39*13^(1/3)/8 - 21*7^(1/3)/8 + (7/2)*log(13/7); approximately 8.60794948.

Files are provided as MATLAB code snippets and have **not** been run in MATLAB itself. The definite integrals were independently checked using symbolic calculation.
