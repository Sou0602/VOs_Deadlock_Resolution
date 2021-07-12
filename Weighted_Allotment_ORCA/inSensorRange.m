function out = inSensorRange(agent, obstacle)
% inSensorRange - Returns true if the obstalce is in sensor range
%
% Syntax: out = inSensorRange(agent, obstacle)
%
    distance = sum((agent.position - obstacle.position).^2) < agent.sensorRange^2;
    sameSide = (agent.position - obstacle.position) * (agent.velocity - obstacle.velocity)' < 0;
    out = distance && sameSide;
    
  
    goal_dir = agent.goal - agent.position;
    goal_dist = norm(goal_dir);
    relative_dist = obstacle.position - agent.position;
    norm_rel_dist = norm(relative_dist);
    
    if dot(goal_dir,relative_dist)/(norm_rel_dist*goal_dist) < 0.8 && goal_dist < 0.5*agent.sensorRange
    out = 0;
    end
    
    if norm_rel_dist > 0.6*agent.sensorRange && obstacle.gflag == 1 && sameSide
    if  dot(goal_dir,relative_dist)/(norm_rel_dist*goal_dist) < 0.9
        out = 0;   
    end
    end
    
    if dot(agent.velocity,relative_dist) < 0 && norm(obstacle.velocity) < 0.001
        out = 0;
    end
    
      %{
    if obstacle.gflag == 1 && norm_rel_dist <= 0.5*agent.sensorRange && sameSide
        
        %
      if norm_rel_dist > 4 * agent.radius && dot(goal_dir,relative_dist)/(norm_rel_dist*goal_dist) < 0.9
          out = 0;
      else
      out = 1;
      end
        %
    end
    %}
    %{
    if dot(agent.velocity,obstacle.position - agent.position) < 0 && sameSide 
        if norm(relative_dist)/norm(agent.velocity-obstacle.velocity) > 7
            out = 0;
        end
    end
    %}
     %}
    %{
    if sqrt(sum((agent.position - obstacle.position).^2)) <= 4*agent.radius 
        out =1;
    end
    %}
     if obstacle.gflag == 1 && norm(relative_dist) < 8*agent.radius && sameSide
         out = 1;
     end
end