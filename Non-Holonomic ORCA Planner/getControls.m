function controls = getControls(agents, obstacles,m, dt, counter)
%getControls - Returns the controls that will avoid collision
%
% Syntax: controls = getControls(agent, obstacles, dt)
%
    agent = agents(m);   
    cost = @(u) 1*desiredVelocityCost(agent, u') + 0.3*sum((agent.velocity - u').^2)+0*sum((u').^2);
    constraints = [];
    
    if length(obstacles) > 0
        constraints = @(u) getConstraints_orca(agents, obstacles, u',m, dt);
    end
    %{
    if m == 4 && counter > 147
        constraints = [];
    end
    %}
    init = agent.velocity' * 0.5;
    lb = [-agent.vmax -agent.vmax];
    ub = [agent.vmax agent.vmax];

    options = optimoptions('fmincon','Display','final-detailed','Algorithm','sqp');
    
    [controls,~,exitflag,~] = fmincon(cost, init, [], [], [], [], lb, ub, constraints, options);
    controls = controls';
    disp(exitflag);
    % Smoothen the controls
    controls = smoothenControls(agent, controls);

end