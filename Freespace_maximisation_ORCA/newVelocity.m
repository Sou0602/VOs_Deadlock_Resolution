function v=newVelocity(agent,v,phi)
%newVelocity - New Velocity from the updaed values of phi and v
%
% Syntax: v =newVelocity(agent,v,w,dt)
%
vmax = agent.vmax;
    vx=v*cos(phi);
    vy=v*sin(phi);
    
    if vx>vmax
        vx=vmax;
    end
    if vy>vmax
        vy=vmax;
    end
    v=[vx,vy];
end