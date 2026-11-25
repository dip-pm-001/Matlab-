function [equation, answer] = q08_function()
% Integral of sec(v)^2 * exp(1+tan(v)) dv.
syms v C
f=sec(v)^2*exp(1+tan(v));
equation=sym([]);
answer=int(f,v)+C;
end
