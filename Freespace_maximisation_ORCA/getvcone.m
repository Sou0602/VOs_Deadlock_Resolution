function vocone = getvcone(v,agent,dt)
v1 = v(1);
v2 = v(2);
wmax = agent.wmax ;
thetam = wmax * dt;

px = agent.position(1);
py = agent.position(2);

m = (v2 - py) / (v1 - px);
m1 = -1/m;
phi = atan2(m1,1);

h = norm(v - agent.position) * tan(thetam);

xp = v1 + h*cos(phi);
yp = v2 + h*sin(phi);

xn = v1 - h*cos(phi);
yn = v2 - h*sin(phi);

vocone = polyshape([px,xn,xp,px],[py,yn,yp,py]);

end