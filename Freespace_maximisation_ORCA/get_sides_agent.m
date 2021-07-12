function agent_sides = get_sides_agent(agent)
agent_sides = 5*ones(1,length(agent.obs));
vin = [];
vout = [];
for p = 1:length(agent.obs)
    v = agent.velocity + agent.position;
    [in,on] = inpolygon(v(1),v(2),agent.ospace(p).Vertices(:,1),agent.ospace(p).Vertices(:,2));
    if in == 1 || on == 1
        vin = [vin , p];
    else
        vout = [vout,p];
    end
end
agent_sides(vout) = 3;
if ~isempty(vin)
perm = dec2bin(2^(length(vin))-1:-1:0);
area = 0;
area_list = [];
regs = [];
common_reg = [];
for i = 1 : size(perm,1)
    
    for j = 1 : length(vin)
        if perm(i,j) == '0'
        reg = agent.rshapes(vin(j));
        elseif perm(i,j) == '1'
        reg = agent.lshapes(vin(j));
        end
        if j == 1
            common_reg = reg;
        end
        
        if j > 1
            common_reg = intersect(common_reg,reg);
        end
    end
    area = common_reg.area;
    regs = [regs,common_reg];
    area_list = [area_list , area];
end
[max_val , ind] = max(area_list);
sides = perm(ind,:);

for k = 1:length(vin)
    agent_sides(vin(k)) = str2double(sides(k));
end
end

end