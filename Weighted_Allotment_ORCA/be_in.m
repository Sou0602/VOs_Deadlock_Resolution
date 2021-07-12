function be = be_in(a_p,p)
    sf=p;
    a=a_p(4);
    b=a_p(3);        
    c=a_p(2);
    d=a_p(1);
    be = a*(sf^3) + b*sf^2 + c*sf + d;
end