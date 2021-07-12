function allotment = get_allotment_ip(agent)

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

f = ones(1,length(vin)*2);
Aeq = zeros(length(vin),2*length(vin));
beq = zeros(length(vin),1);
intcon = zeros(1,2*length(vin));
%Right and Left
for j = 1:length(vin)
    right_inter = intersect(agent.freespace,agent.rshapes(vin(j)));
    left_inter  = intersect(agent.freespace,agent.lshapes(vin(j)));
    f(1,2*j-1) = right_inter.area;
    f(1,2*j)   = left_inter.area;
    Aeq(j,2*j-1) = 1;
    Aeq(j,2*j)   = 1;
    beq(j)       = 1;
    intcon(1,2*j-1) = 2*j-1;
    intcon(1,2*j) = 2*j;
end

%% Solve Optimisation max f
lb = zeros(1,2*length(vin));
ub = ones(1,2*length(vin));

if ~isempty(vin)
vin_sides = intlinprog(-f,intcon,[],[],Aeq,beq,lb,ub);
for k = 1:length(vin_sides)
    if vin_sides(k) == 1
        if mod(k,2) == 0
            jind = k/2;
            agent_sides(vin(jind)) = 1;
        else
            jind = (k+1)/2;
            agent_sides(vin(jind)) = 0;
        end
    end
end
end

allotment = agent_sides;
end