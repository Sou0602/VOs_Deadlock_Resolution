function cost = smoothnessCost_joint(agents, control)
%desiredVelocityCost - Deviation from the desired velocity
%
% Syntax: cost = desiredVelocityCost(agent, control)
%

    cost = 0;
    for i = 1:length(agents)
           vdes = agents(i).velocity;
           cost = cost + (vdes(1) - control(i))^2 + (vdes(2) - control(length(agents)+i))^2;
    end
    
    
    
end