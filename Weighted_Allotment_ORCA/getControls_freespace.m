function controls  = getControls_freespace(agents,i, dt)
%getControls - Returns the controls that will avoid collision
%
% Syntax: controls = getControls(agent, obstacles, dt)
%
    
    cost = @(u) 1*desiredVelocityCost(agents(i), u') + 0*sum((agents(i).velocity - u').^2)+0*sum((u').^2)+ 0*repulsion_cost(agents,i,u',dt);
   
    constraints = [];
    A = [];
    B = [];
    [A,B] = getlcon(delaunay_regions(agents(i)));
    A = A(1:5,:);
    B = B(1:5, :);
    init = agents(i).velocity' * 0.5;
    lb = [-agents(i).vmax, -agents(i).vmax];
    ub = [agents(i).vmax, agents(i).vmax];
    options = optimoptions('fmincon','Display','final-detailed','Algorithm','sqp');
    
 
    [controls,~,exitflag,~] = fmincon(cost, init, A, B, [], [], lb, ub, constraints, options);
    
    disp(exitflag);
    controls = controls';
    % Smoothen the controls
   % controls = smoothenControls(agent, controls);

end