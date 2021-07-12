function [sides,rws,lws,zws] = allotment_weights(agents,counter)
% allotment_weights - It follows a non-linear weighting atrategy based on
% the distances between the agents and obstacles and allots a side to the
% collision cone.
%
% Syntax: [sides,rws,lws,zws] = allotment_weights(agents,counter)
%  
for m = 1:length(agents)
    if(agents(m).gflag~=1)
% Give weights to all the surrounding obstacle free space sides
% Whichever side of the freespace is closest to the agent_position gets the
% higher weight.
if ~isempty(agents(m).obs)
    agents(m).lweights = 0;
    agents(m).rweights = 0;
    agents(m).rws = [];
    agents(m).lws = [];
    agents(m).zws = [];
for j = 1:length(agents(m).obs)

    k = str2double(agents(m).obs(j));
    dist = [norm(agents(m).rcentroid - agents(k).position),norm(agents(m).lcentroid - agents(k).position)];
    [~,min_ind] = min(dist);
%let default side is right and equal to 0, left is equal to 1 
% Assign rshape weights
% Assign lshape weights
if dist(1) ~= dist(2)
   if min_ind == 1
       
       [dist_weight] = getdist_weight(dist(min_ind),agents,m,k,counter);
       agents(m).rweights = agents(m).rweights + dist_weight;
       disp("rweighted");
       if dist_weight ~= 0
       agents(m).rws = [agents(m).rws,k];
       else
       agents(m).zws = [agents(m).zws,k];
       end
   elseif min_ind == 2
       [dist_weight] = getdist_weight(dist(min_ind),agents,m,k,counter);
       %agents(m).lweights = agents(m).lweights + 1*(1/dist(min_ind));
       agents(m).lweights = agents(m).lweights + dist_weight;
       if dist_weight ~= 0
       agents(m).lws = [agents(m).lws,k];
       else
       agents(m).zws = [agents(m).zws,k];
       end
       disp("lweighted");
   end
else
   [dist_weight] = getdist_weight(dist(min_ind),agents,m,k,counter);
    agents(m).rweights = agents(m).rweights + dist_weight;
    agents(m).lweights = agents(m).lweights + dist_weight;
    if dist_weight == 0
        agents(m).zws = [agents(m).zws, k];
    end
    disp("both");
end

% Complete giving weights
end

else
    agents(m).lweights = -1;
    agents(m).rweights = -1;
    agents(m).rws = [];
    agents(m).lws = [];
    agents(m).zws = [];
    disp("empty obs");
end
    end
end
sides = [];
rws = zeros(length(agents),length(agents)-1);
lws = zeros(length(agents),length(agents)-1);
zws = zeros(length(agents),length(agents)-1);
% Choosing the choose the side with minimum weight or max-free space(if same weight then max)
for m = 1:length(agents)
    rws(m,1:length(agents(m).rws)) = agents(m).rws;
    lws(m,1:length(agents(m).lws)) = agents(m).lws;
    zws(m,1:length(agents(m).zws)) = agents(m).zws;
    weights = [agents(m).rweights,agents(m).lweights];
    [~,sidemin] = min(weights);
    if weights(1) < 0 || agents(m).gflag == 1
        agents(m).side = 2;
    else
    if agents(m).rweights ~= agents(m).lweights
        if sidemin == 1
            agents(m).side = 0;
        else
            agents(m).side = 1;
        end
    else
        agents(m).side  = 0;
    end
    end
    sides = [sides,agents(m).side];
end

end