# IT Workshop Practical — Assignment 2 (MATLAB)

Source: uploaded assignment-2.pdf (one-page handout, 12 questions).

Each question has two MATLAB files, satisfying the handout's user-defined function + script requirement:
- q01_function.m to q12_function.m are symbolic user-defined functions.
- q01_script.m to q12_script.m call the corresponding function and display its result.

Set MATLAB's Current Folder to Assignment-2, install Symbolic Math Toolbox, and run q01_script, q02_script, etc.

Questions 1–5: differential equations using symbolic int() and algebraic solve().
Questions 6–9: indefinite integration using int().
Questions 10–12: definite integration using int().

## Reference answers
1. (y-1)*exp(y)+exp(-x)+exp(-3*x)/3=C; y=1+lambertw((C-exp(-x)-exp(-3*x)/3)/exp(1)).
2. y^2+sec(3*x)^2/6=1/6. No real solution on any open interval about x=pi satisfying y(pi)=0; complex branches are returned.
3. y=sin(asin(x)+pi/3), locally valid real branch through x=0.
4. -1/(2*(1+exp(x))^2)-1/(1+exp(y))=C.
5. y=sqrt((sqrt(1+x^2)+sqrt(101)-sqrt(2))^2-1).
6. 6*sin(z)+4*asin(z)+C.
7. x^(9/2)/27-x^(5/6)/5+C.
8. exp(1+tan(v))+C.
9. -5/3*(1+exp(2-8*w))^(3/2)+7*w^4/4-9*w^(4/3)/2+C.
10. log(2)/7+(3/20)*(2^(5/3)-1)-3/16.
11. 255/4+78/pi.
12. (3/8)*(13^(4/3)-7^(4/3))+(7/2)*log(13/7).

Important: Q2 has a singular real initial-value condition, and Q3's positive-square-root ODE imposes a local branch restriction. These are not MATLAB bugs.

All expressions were reviewed symbolically; MATLAB runtime/testing was not available here.
