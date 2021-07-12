function cost = repulsion_cost(agents,i,u,dt)
% repulsion_cost - introduce a cost where the agent repels from the
% neighboring osbtacles. Similar to a repulsive artificial potential field
%
% Syntax: cost = repulsion_cost(agents,i,u,dt)
%  
dist = 0;
agent_pos = agents(i).position + u * dt;
if ~isempty(agents(i).obs)
for k = 1:length(agents(i).obs)
    oname = str2double(agents(i).obs(k));
    obs_pos = agents(oname).position + agents(oname).velocity * dt;
    dist = dist + norm(agent_pos - obs_pos);
end
cost = -dist;
else
    cost = 0;
end
end