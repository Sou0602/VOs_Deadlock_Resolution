function an = theta(params,p)
% theta - calculating current orientation from the polynomial at sf
%
% Syntax: an = theta(params,p)
%
        sf = p(5);
        a = a3(p);
        b = a2(p);
        c = a1(p);
        d = a4(p);
        an = a*sf^4/4 + b*sf^3/3 + c*sf^2/2 + d*sf+params.thetai;
end