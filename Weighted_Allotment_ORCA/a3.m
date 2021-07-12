function an = a3(p)
% a3 - Co-efficient of the cubic spline polynomial
%
% Syntax: an = a3(p)
%
    an = -(9*p(1)/2 - 27 * p(2) /2 + 27 * p(3)/2 - 9 *p(4)/2)/(p(5)^3);
end
    