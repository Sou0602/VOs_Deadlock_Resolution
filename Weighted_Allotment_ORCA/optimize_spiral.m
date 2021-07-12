function an = optimize_spiral(params,l,u,of)
% optimize_spiral - Optimisation to find the co-efficients of the cubic spiral polynomial 
%
% Syntax: an = optimize_spiral(params)
%

        %cost=@(k) objec(params,k);
        %% The parameter of is reesmblance of the outflag used in the outerloop. 
        % With of = 1, we have a higher preference to the theta parameter
        % in the curvature optimization.
        if of == 1
        w = 4;
        elseif of == 2
            w = 10;
        else
            w = 1;
        end
        
        
        cost=@(p) (x_fren(params,p,1000)-params.xf)^2 + (y_fren(params,p,1000)-params.yf)^2 +  w*(theta(params,p)-params.thetaf)^2;
        
        sf_0 = norm([params.xf-params.xi, params.yf-params.yi]);
        constraints=[];
        init=[0,0,0,0,sf_0];
        
        lb= [params.kf,-1,-1,l,-Inf];
        ub= [params.kf,1,1,u,Inf];
        
        %options = struct('GradObj','off','Display','iter','LargeScale','off','HessUpdate','bfgs','InitialHessType','identity','GoalsExactAchieve',1,'GradConstr',false);
        options = optimoptions('fmincon','display','off','Algorithm','active-set','MaxIterations',3);%,'Display','final-detailed','Algorithm','interior-point','HessianApproximation','lbfgs');
        res = fmincon(cost, init, [], [], [], [], lb, ub, constraints, options)';
        
        p1=res(1);
        p2=res(2);
        p3=res(3);
        p4=res(4);
        p5=res(5);
        an=[p1,p2,p3,p4,p5];
end