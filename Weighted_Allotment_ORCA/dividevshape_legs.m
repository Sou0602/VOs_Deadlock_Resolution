function [rshape,lshape] = dividevshape_legs(agent,volegs,m)

freespace = agent.sqpoly;
apex = volegs(m,1:2);
p1 =  volegs(m,3:4);
p2 =  volegs(m,5:6);
oreg = agent.ospace(m);
p = [p1 ; p2];
position = apex;
rshape_list = [];
lshape_list = [];
for j = 1 : length(p)
velocity = 0.1*(p(j,:) - apex)/(norm(p(j,:)-apex));

%
xp = [position(1), position(1)+velocity(1)];
yp = [position(2), position(2)+velocity(2)];

xn =  [position(1), position(1)-velocity(1)];
yn =  [position(2), position(2)-velocity(2)];

[xint1,yint1] = getintersection(xp,yp,agent.sqpoly);
[xint2,yint2] = getintersection(xn,yn,agent.sqpoly);

xv = agent.sqpoly.Vertices(:,1);
yv = agent.sqpoly.Vertices(:,2);

sqpoly_x = zeros(1,4);
sqpoly_y = zeros(1,4);
apos = agent.position;
for i = 1:length(xv)
theta = atan2(-agent.position(2)+yv(i),-agent.position(1)+xv(i));

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

alpha = atan2(yint1-apos(2),xint1-apos(1));
beta =  atan2(yint2-apos(2),xint2-apos(1));
if alpha < 0 
    alpha = 2*pi + alpha;
end
if beta < 0 
    beta = 2*pi + beta;
end

if alpha > 7*pi/4 && alpha <= 2*pi || alpha >= 0 && alpha < pi/4
    if beta > 5*pi/4 && beta <= 7*pi/4
        rshape_x = [xint1 , x4, xint2 , xint1];
        rshape_y = [yint1 , y4, yint2 , yint1];
        lshape_x = [xint1,x3 , x2 , x1, xint2 , xint1];
        lshape_y = [yint1,y3 , y2 , y1, yint2 , yint1];
    elseif beta > 3*pi/4 && beta <= 5 * pi/4
        rshape_x = [xint1 , x4,x1, xint2];
        rshape_y = [yint1 , y4,y1, yint2];
        lshape_x = [xint1,x3 , x2 , xint2];
        lshape_y = [yint1,y3 , y2 , yint2];
    elseif beta >= pi/4 && beta <= 3*pi/4
        rshape_x = [xint1 , x4,x1,x2, xint2];
        rshape_y = [yint1 , y4,y1,y2, yint2];
        lshape_x = [xint1,x3 , xint2,xint1];
        lshape_y = [yint1,y3 , yint2,yint1];
    end
elseif alpha > 5*pi/4 && alpha < 7*pi/4
    if beta > 3*pi/4 && beta < 5 * pi/4
        rshape_x = [xint1 , x1, xint2];
        rshape_y = [yint1 , y1, yint2];
        lshape_x = [xint1,x4 , x3 , x2, xint2];
        lshape_y = [yint1,y4 , y3 , y2, yint2];
    elseif beta > pi/4 && beta < 3*pi/4
        rshape_x = [xint1 , x1,x2, xint2];
        rshape_y = [yint1 , y1,y2, yint2];
        lshape_x = [xint1,x4 , x3 , xint2];
        lshape_y = [yint1,y4 , y3 , yint2];
    elseif beta > 7*pi/4 && beta <= 2*pi || beta > 0 && beta < pi/4
        rshape_x = [xint1 , x1,x2,x3, xint2];
        rshape_y = [yint1 , y1,y2,y3, yint2];
        lshape_x = [xint1,x4 , xint2];
        lshape_y = [yint1,y4 , yint2];
     end
elseif alpha < 5*pi/4 && alpha > 3*pi /4
     if beta > pi/4 && beta < 3*pi/4
        rshape_x = [xint1 , x2, xint2];
        rshape_y = [yint1 , y2, yint2];
        lshape_x = [xint1,x1 , x4 , x3, xint2];
        lshape_y = [yint1,y1 , y4 , y3, yint2];
    elseif beta > 7*pi/4 && beta <= 2*pi || beta > 0 && beta < pi/4
        rshape_x = [xint1 , x2,x3, xint2];
        rshape_y = [yint1 , y2,y3, yint2];
        lshape_x = [xint1,x1 , x4 , xint2];
        lshape_y = [yint1,y1 , y4 , yint2];
    elseif beta > 5*pi/4 && beta < 7 * pi/4
        rshape_x = [xint1 , x2,x3,x4, xint2];
        rshape_y = [yint1 , y2,y3,y4, yint2];
        lshape_x = [xint1,x1 , xint2];
        lshape_y = [yint1,y1 , yint2];
     end
elseif alpha > pi/4 && alpha < 3*pi/4
     if beta > 7*pi/4 && beta <= 2*pi || beta > 0 && beta < pi/4
        rshape_x = [xint1 , x3, xint2];
        rshape_y = [yint1 , y3, yint2];
        lshape_x = [xint1,x2 , x1 , x4, xint2];
        lshape_y = [yint1,y2 , y1 , y4, yint2];
    elseif beta > 5*pi/4 && beta < 7*pi/4
        rshape_x = [xint1 , x3,x4, xint2];
        rshape_y = [yint1 , y3,y4, yint2];
        lshape_x = [xint1,x2 , x1 , xint2];
        lshape_y = [yint1,y2 , y1 , yint2];
    elseif beta > 3*pi/4 && beta < 5 * pi/4
        rshape_x = [xint1 , x3,x4,x1, xint2];
        rshape_y = [yint1 , y3,y4,y1, yint2];
        lshape_x = [xint1,x2 , xint2];
        lshape_y = [yint1,y2 , yint2];
     end
end

rshape_list = [rshape_list ; polyshape(rshape_x,rshape_y)];
lshape_list = [lshape_list ; polyshape(lshape_x,lshape_y)];

%rshape_list(i) = intersect(freespace,rshape_list(i));
%lshape_list(i) = intersect(freespace,lshape_list(i));
end

r1 = intersect(oreg,rshape_list(1));
r2 = intersect(oreg,rshape_list(2));

l1 = intersect(oreg,lshape_list(1));
l2 = intersect(oreg,lshape_list(2));

if area(r1) < area(r2)
    rshape = rshape_list(1);
else
    rshape = rshape_list(2);
end
if area(l1) < area(l2)
    lshape = lshape_list(1);
else
    lshape = lshape_list(2);
end


end