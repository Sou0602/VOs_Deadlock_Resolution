function an = theta_in(params,a_p,p)
% theta - calculating current orientation from the polynomial at any p
%
% Syntax: an = theta_in(params,a_p,p)
%
        sf=p;
        a=a_p(4);
        b=a_p(3);
        c=a_p(2);
        d=a_p(1);
        an = a*sf^4/4 + b*sf^3/3 + c*sf^2/2 + d*sf + params.thetai;
end