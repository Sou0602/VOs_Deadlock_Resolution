function average_dist(agent)

for i = 1 : length(agent.ospace)
vo = agent.ospace(i);
apex = agent.volegs(i,1:2);
p1 = agent.volegs(i,3:4);
p2 = agent.volegs(i,5:6);
l1 = p1 - apex;
l2 = p2 - apex;

ix = apex(1);
iy = apex(2);
px = agent.velocity(1)+agent.position(1);
py = agent.velocity(2)+agent.position(2);
a1 = l1(1);
b1 = l1(2);
c1 = sqrt(a1^2 + b1^2);
a1 = a1/c1;
b1 = b1/c1;

 ny1 = (a1*b1*(px - ix) + b1^2 * py + a1^2 * iy )/ (a1^2 + b1^2);
 nx1 = px - (b1/a1) * (ny1 - py);
 n1 = sqrt((nx1 - px)^2 + (ny1 - py)^2);

a2 = l2(1);
b2 = l2(2);
c2 = sqrt(a2^2 + b2^2);
a2 = a2/c2;
b2 = b2/c2;

 ny2 = (a2*b2*(px - ix) + b2^2 * py + a2^2 * iy )/ (a2^2 + b2^2);
 nx2 = px - (b2/a2) * (ny2 - py);
 n2 = sqrt((nx2 - px)^2 + (ny2 - py)^2);
 
 n = min(n1,n2);
end




end



