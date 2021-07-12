function [rshape,lshape] = dividevshape(agent)

freespace = agent.freespace;



position = agent.position;
velocity = agent.velocity;
goal = agent.goal;

pos_p = position + (goal - position)/norm(goal - position);
pos_n =  position - (goal - position)/norm(goal - position);
%
xp = [position(1), position(1)+velocity(1)];
yp = [position(2), position(2)+velocity(2)];

xn =  [position(1), position(1)-velocity(1)];
yn =  [position(2), position(2)-velocity(2)];
%}
%{
xp = [position(1), pos_p(1) ];
yp = [position(2), pos_p(2)];

xn =  [position(1), pos_n(1)];
yn =  [position(2), pos_n(2)];
%}
[xint1,yint1] = getintersection(xp,yp,agent.sqpoly);
[xint2,yint2] = getintersection(xn,yn,agent.sqpoly);

xv = agent.sqpoly.Vertices(:,1);
yv = agent.sqpoly.Vertices(:,2);

sqpoly_x = zeros(1,4);
sqpoly_y = zeros(1,4);

for i = 1:length(xv)
theta = atan2(-position(2)+yv(i),-position(1)+xv(i));

if theta <= - 2.3562 + 0.2 && theta >= - 2.3562 - 0.2
    x1 = xv(i);
    y1 = yv(i);
elseif theta <=  2.3562 + 0.2 && theta >=  2.3562 - 0.2
    x2 = xv(i);
    y2 = yv(i);
elseif theta <= 0.7854 + 0.2 && theta >= 0.7854 - 0.2
    x3 = xv(i);
    y3 = yv(i);
elseif theta <= -0.7854 + 0.2 && theta >= -0.7854 - 0.2
    x4 = xv(i);
    y4 = yv(i);
end
end

vel_phi = atan2(velocity(2),velocity(1));

if vel_phi < 0 
    vel_phi = 2*pi + vel_phi;
end

if vel_phi >= 0 && vel_phi < pi/4
rshape_x = [xint1,x4,x1,xint2];
rshape_y = [yint1,y4,y1,yint2];
lshape_x = [xint1,x3,x2,xint2];
lshape_y = [yint1,y3,y2,yint2];

elseif vel_phi == pi/4
rshape_x = [x3,x4,x1];
rshape_y = [y3,y4,y1];
lshape_x = [x3,x2,x1];
lshape_y = [y3,y2,y1]; 

elseif vel_phi > pi/4 && vel_phi < 3*pi/4
rshape_x = [xint1,x3,x4,xint2];
rshape_y = [yint1,y3,y4,yint2];
lshape_x = [xint1,x2,x1,xint2];
lshape_y = [yint1,y2,y1,yint2];

elseif vel_phi == 3*pi/4
rshape_x = [x2,x3,x4];
rshape_y = [y2,y3,y4];
lshape_x = [x2,x1,x4];
lshape_y = [y2,y1,y4]; 
    
elseif vel_phi > 3*pi/4 && vel_phi < 5*pi/4
rshape_x = [xint1,x2,x3,xint2];
rshape_y = [yint1,y2,y3,yint2];
lshape_x = [xint1,x1,x4,xint2];
lshape_y = [yint1,y1,y4,yint2];

elseif vel_phi == 5*pi/4
rshape_x = [x1,x2,x3];
rshape_y = [y1,y2,y3];
lshape_x = [x1,x4,x3];
lshape_y = [y1,y4,y3]; 

elseif vel_phi > 5*pi/4 && vel_phi < 7*pi/4
rshape_x = [xint1,x1,x2,xint2];
rshape_y = [yint1,y1,y2,yint2];
lshape_x = [xint1,x4,x3,xint2];
lshape_y = [yint1,y4,y3,yint2];

elseif vel_phi == 7*pi/4
rshape_x = [x4,x1,x2];
rshape_y = [y4,y1,y2];
lshape_x = [x4,x3,x2];
lshape_y = [y4,y3,y2]; 
    
elseif vel_phi > 7*pi/4 && vel_phi <= 2*pi
rshape_x = [xint1,x4,x1,xint2];
rshape_y = [yint1,y4,y1,yint2];
lshape_x = [xint1,x3,x2,xint2];
lshape_y = [yint1,y3,y2,yint2];
end

rshape = polyshape(rshape_x,rshape_y);
lshape = polyshape(lshape_x,lshape_y);

rshape = intersect(freespace,rshape);
lshape = intersect(freespace,lshape);



end