function answer = Q06_Integration()
% Integral [6*cos(z)+4/sqrt(1-z^2)] dz.
syms z
answer = simplify(int(6*cos(z)+4/sqrt(1-z^2),z));
end
