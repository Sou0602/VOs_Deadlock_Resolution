function allot_reg = allotment_freespace(agents)

cost = @(u) goal_reaching_cost(agents,u);
lb = ones(1,length(agents));
ub = zeros(1,length(agents));
for i = 1:length(agents)
    ub(i) = length(agents(i).region_list);
end
IntCon = 1:1:length(agents);

allot_reg = ga(cost,length(agents),[],[],[],[],lb,ub,[],IntCon);

end