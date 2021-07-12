function dist = cost2goal(agents,i,u,dt)
fpos = agents(i).position + u * dt;
goal = agents(i).goal;
dist = sum((fpos - goal).^2);

end