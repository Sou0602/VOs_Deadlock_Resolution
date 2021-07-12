function [pos,theta]=newPosition(agent,v,w,dt)
%newPosition - Position update from new controls obtained from cubic spiral trajectory
%
% Syntax: [pos,theta]=newPosition(agent,v,w,dt)
%  
    theta=agent.phi+w*dt;
    
    x=agent.position(1)+v*cos(theta)*dt;
    y=agent.position(2)+v*sin(theta)*dt;
    pos=[x,y];

end