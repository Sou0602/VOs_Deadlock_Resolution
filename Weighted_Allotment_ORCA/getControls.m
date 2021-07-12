function controls  = getControls(agents,i, dt,counter)
%getControls - Returns the controls that will avoid collision
%
% Syntax: controls = getControls(agent, obstacles, dt)
%

    w = 0;
    
    cost = @(u) 1*desiredVelocityCost(agents(i), u') + 0.3*sum((agents(i).velocity - u').^2)+0*sum((u').^2)+ w*repulsion_cost(agents,i,u',dt) + 0*cost2goal(agents,i,u',dt);
   
    constraints = [];
    A = [];
    B = [];

    
    %Non lin orca
    %
    
   %% For cases, where we judiciously use ORCA and Allotment together. In this particular usage, since we 
   %% input a configuration that is output from ORCA, we run the allotment for the first 65 iterations and then
   %% revert back to ORCA
   %{
   orca_t = 65;
    if agents(i).side == 2
        constraints = [];
    elseif agents(i).side == 0 && counter < orca_t
    constraints = @(u) getConstraints_orca_r(agents,i, u', dt);   
    elseif agents(i).side == 1 && counter < orca_t
    constraints = @(u) getConstraints_orca_l(agents,i, u', dt);
    elseif counter >= orca_t
        constraints = @(u) getConstraints_orca(agents,i,u',dt);
    end
    %}
    
   %% For cases, where we directly run the allotment algorithm from the start configuration.
   
   if agents(i).side == 2
        constraints = [];
    elseif agents(i).side == 0
    constraints = @(u) getConstraints_orca_r(agents,i, u', dt);   
    elseif agents(i).side == 1 
    constraints = @(u) getConstraints_orca_l(agents,i, u', dt);
    end
   
   
    %lin orca
    %% Linear version of the constraints, not developed completely.
    %{
    if agents(i).side ~= 2 
        
    for k = 1:length(agents(i).obs)
    oname = str2double(agents(i).obs(k));
    [u,norm] = getdist_orca(agents,i,oname);
    if ~isempty(u)
    if agents(i).side == 1
        v = u(1,:);
        nor = norm(1,:);
    elseif agents(i).side == 0
        v = u(2,:);
        nor = norm(2,:);
    end
    a = zeros(1,2);     
    a(1) = -nor(1);
    a(2) = -nor(2);
    b = -(agents(i).velocity(1)+v(1)*0.5)*nor(1) -(agents(i).velocity(2)+v(2)*0.5)*nor(2) ;
    A = [A;a];
    B = [B;b];
    end
    end
    end
    %}
    
    init = agents(i).velocity' *0.5;
    lb = [-agents(i).vmax, -agents(i).vmax];
    ub = [agents(i).vmax, agents(i).vmax];
    options = optimoptions('fmincon','Display','final-detailed','Algorithm','sqp');
    
 
    [controls,~,exitflag,~] = fmincon(cost, init, A, B, [], [], lb, ub, constraints, options);
    
    disp(exitflag);
    controls = controls';
    % Smoothen the controls
   % controls = smoothenControls(agent, controls);

end