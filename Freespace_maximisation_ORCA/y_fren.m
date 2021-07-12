function an = y_fren(params,p,n)
% x-fren - calculating current y from the polynomial using fresnel integral
%
% Syntax: an = y_fren(params,p)
%  
        a = a3(p);
        b = a2(p);
        c = a1(p);
        sf = p(5);
        d = a4(p);
        a_p = [d,c,b,a];
        x = linspace(0,sf,n+1); % N+1 points make N subintervals
        xr = x(2:length(x));
        
        for i =1:length(xr)
            y(i) = sin(theta_in(params,a_p,xr(i)));
        end
        
        y_right = y(2:length(y));  % right endpoints
        y_left = y(1:length(y)-1); % left endpoints
        dx = (sf - 0)/n;
        
        T = (dx/2) * sum(y_right + y_left)+(dx/2)* sin(theta_in(params,a_p,(x(1)+x(2))/2))+params.yi;
            
        an = T;
end