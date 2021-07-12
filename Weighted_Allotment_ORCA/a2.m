function an=a2(p)
% a2 - Co-efficient of the cubic spline polynomial
%
% Syntax: an = a2(p)
%
        an = (9 * p(1) - 45 *p(2)/2 + 18*p(3)-9*p(4)/2)/(p(5)^2);
end