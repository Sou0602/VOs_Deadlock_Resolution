function cost = goal_reaching_cost(agents,u)

cost = 0;
for i = 1 :length(agents)
    k = u(i);
    chosen_reg = agents(i).region_list(k);
    [xg,yg] = chosen_reg.centroid;
    velg = [xg,yg] - agents(i).position;
    %dist = norm(agents(i).goal - [xg,yg]);
    dist = norm(agents(i).velocity - velg);
    cost = cost + dist ^ 2 + chosen_reg.area;
end

end