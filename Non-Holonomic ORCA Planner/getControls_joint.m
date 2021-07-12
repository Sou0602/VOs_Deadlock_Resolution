function [controls , exitflag]= getControls_joint(agents, dt)



cost = @(u) 1*desiredVelocityCost_joint(agents, u') + 0.3*smoothnessCost_joint(agents, u');
    constraints = [];
    init = zeros(2*length(agents),1);
    sum = 0;
    
    for i = length(agents)
        init(i) = 0.5*agents(i).velocity(1);
        init(length(agents) + i ) = 0.5*agents(i).velocity(2);
        sum = sum + length(agents(i).obs);
    end
    
 
     
    if sum > 0
        constraints = @(u) getConstraints_mrvo_joint(agents, u', dt);
    end
    

    
    lb = -agents(1).vmax*ones(1,2*length(agents));
    ub =  agents(1).vmax*ones(1,2*length(agents));

    options = optimoptions('fmincon','Display','final-detailed','Algorithm','sqp');
    
 
    [controls,~,exitflag,~] = fmincon(cost, init, [], [], [], [], lb, ub, constraints, options);
    disp(exitflag);
    controls = controls';
    % Smoothen the controls
    %controls = smoothenControls(agent, controls);

end







