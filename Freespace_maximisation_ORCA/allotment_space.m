function allotment_space(agents)

% minimum freespace gets priority
% weights shift from surrounding agents to the agent
% side with maximum weight has least priority
% also think about the case where freespaces intersect

for m = 1:length(agents)
% Give weights to all the surrounding obstacle free space sides
% Whichever side of the freespace is closest to the agent_position gets the
% weight
for j = 1:length(agents(m).obs)
     k = str2double(agents(m).obs(j).name);
    %
    rdist = [norm(agents(m).rcentroid - agents(k).rcentroid),norm(agents(m).rcentroid - agents(k).lcentroid)];
    ldist = [norm(agents(m).lcentroid - agents(k).rcentroid),norm(agents(m).lcentroid - agents(k).lcentroid)];
    dist = [rdist,ldist];
    %}
  
    [~,min_ind] = min(dist);
%let default side is right and equal to 0, left is equal to 1 
% Assign rshape weights
% Assign lshape weights
if dist(1) == dist(2) && min_ind == 1
    agents(k).rweights_space = [agents(k).rweights_space; m , 0 , 0.5];
    agents(k).lweights_space = [agents(k).lweights_space; m , 0 , 0.5];
elseif dist(3) == dist (4) && min_ind == 3
    agents(k).rweights_space = [agents(k).rweights_space; m , 1 , 0.5];
    agents(k).lweights_space = [agents(k).lweights_space; m , 1 , 0.5];
elseif dist(1) == dist (3) && min_ind == 1
    agents(k).rweights_space = [agents(k).rweights_space; m , 0 , 0.5];
    agents(k).rweights_space = [agents(k).rweights_space; m , 1 , 0.5];
elseif dist(1) == dist(4) && min_ind == 1
    agents(k).rweights_space = [agents(k).rweights_space; m , 0 , 0.5];
    agents(k).lweights_space = [agents(k).lweights_space; m , 1 , 0.5];
elseif dist(2) == dist(3) && min_ind == 2
    agents(k).lweights_space = [agents(k).lweights_space; m , 0 , 0.5];
    agents(k).rweights_space = [agents(k).rweights_space; m , 1 , 0.5];
elseif dist(2) == dist(4) && min_ind == 2
    agents(k).lweights_space = [agents(k).lweights_space; m , 0 , 0.5];
    agents(k).lweights_space = [agents(k).lweights_space; m , 1 , 0.5];
elseif min_ind == 1
    agents(k).rweights_space = [agents(k).rweights_space; m , 0 , 1];
elseif min_ind == 2
    agents(k).lweights_space = [agents(k).lweights_space; m , 0 , 1];
elseif min_ind == 3
     agents(k).rweights_space = [agents(k).rweights_space; m , 1 , 1];
elseif min_ind == 4
    agents(k).lweights_space = [agents(k).lweights_space; m , 1 , 1];
% Complete giving weights
end
end
end
weights = [];
for m = 1:length(agents)
    agents(m).rweights_sum = sum(agents(m).rweights_space(:,3));
    agents(m).lweights_sum = sum(agents(m).lweights_space(:,3));
    weights = [weights , agents(m).rweights_sum,agents.lweights_sum];
end

[max_weight,max_ind] = max(weights);
weights_sim = [max_ind];
for k = 1:length(weights)
    if k ~= max_ind
        if weights(k) == max_weight
            weights_sim = [weights_sim , k];
        end
    end  
end
sim_agents = zeros(2,length(weights_sim));
for i = 1:length(weights_sim)
    sim_agents(1,i) = floor(weights_sim(i),2);
    sim_agents(2,i) = mod(weights_sim(i),2); % mod = 1 - right is max , mod = 0 - left is max
end
% Choosing the choose the side with minimum weight or max-free space(if same weight then max)

for i = 1:size(sim_agents,2)
    m = sim_agents(1,i);
    agents(m).side = sim_agents(2,i);
    if agents(m).side == 0
        %choose right side nearest neighbour and proceed
    elseif agents(m).side == 1
        %choose left side nearest neighbour and proceed
end

end