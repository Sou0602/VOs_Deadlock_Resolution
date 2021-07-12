function [dist_weight] = getdist_weight(dist,agents,i,k,counter)
%% getdist_weight - A non-linear weighting strategy to get the weights based on distances
%
%Syntax  : [dist_weight] = getdist_weight(dist,agents,i,k,counter)
%
pflag = 0;
pobs = 0;
if dist < 4.5*agents(i).radius
    dist_weight = 1*length(agents)*(1/dist);

elseif dist >= 4.5*agents(i).radius && dist < 7*agents(i).radius
    dist_weight = (1/dist);
else
    dist_weight = (1/dist)/length(agents);
end
%}
% Using a time to collision approach to give weights. _ Optional.
%time to collision
%{
relative_dist = agents(k).position - agents(i).position;
nor_rel_dist = norm(relative_dist);
unit_rel_dist = relative_dist/nor_rel_dist;
kvel_dist = dot(agents(k).velocity,unit_rel_dist)*(unit_rel_dist);
ivel_dist = dot(agents(i).velocity,unit_rel_dist)*(unit_rel_dist);
rel_vel_dist = ivel_dist - kvel_dist;
ttc = nor_rel_dist / norm(rel_vel_dist);
distfromgoal = norm(agents(i).goal - agents(i).position);
ttc
%{
    if length(agents(i).obs) == 1 && ttc > 50 && counter > 50
       % dist_weight = 0;
        if length(agents(i).obs) < length(agents(k).obs)
        end
    end
%}
%{
if ttc <= 6
dist_weight = dist_weight + 10/ttc;
elseif ttc > 6 && ttc <= 7.5
dist_weight = dist_weight + 3/ttc;
elseif ttc > 7.5 && ttc < 9
dist_weight = dist_weight + 1/ttc;
elseif ttc > 9
dist_weight = 0;
end
%}
%}
%{
% If the obstacle has reached its goal , it doesnt have a priority in
% weighting

if agents(k).gflag == 1
    dist_weight = 0;
end
    %}
end