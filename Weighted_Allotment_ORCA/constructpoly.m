function vo_poly = constructpoly(agent,apex_cone,xint1,yint1,xint2,yint2)
%constructpoly - Constructs the Polyshape of the Velocity Obstacle.It takes
%the input of the legs of the velocity obstacles intersecting the freespace
%square and then find the appropriate boundary for the VO.
%
% Syntax: vo_poly = constructpoly(agent,apex_cone,xint1,yint1,xint2,yint2)
%
px = apex_cone(1);
py = apex_cone(2);

%vo_poly = polyshape([px,xint1,xint2,px],[py,yint1,yint2,py]);    

xv = agent.sqpoly.Vertices(:,1);
yv = agent.sqpoly.Vertices(:,2);

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
sq_x = [x1,x2,x3,x4];
sq_y = [y1,y2,y3,y4];

[in,~] = inpolygon(px,py,xv,yv);
if in == 1
    p1 = ([xint1-px yint1-py])/norm([xint1-px yint1-py]);
    p2 = ([xint2-px yint2-py])/norm([xint2-px yint2-py]);
    
    n1 = [p1(2) -p1(1)];%outward normal
    n2 = [p2(2) -p2(1)];%outward normal
    
    tp1 = atan2(p1(2),p1(1));
    tp2 = atan2(p2(2),p2(1));
    tn1 = atan2(n1(2),n1(1));
    tn2 = atan2(n2(2),n2(1));
    
    thetas = [tp1,tp2,tn1,tn2];
    
    for m = 1:length(thetas)
    if thetas(m) < 0 && thetas(m) >= -pi
        thetas(m) = thetas(m) + 2*pi;
    end
    end
    tp1 = thetas(1);
    tp2 = thetas(2);
    tn1 = thetas(3);
    tn2 = thetas(4);
    
    t1diff = tn1 - tp1;
    t2diff = tn2 - tp2;
    tpdiff = tp2 - tp1;
    
    if tp1 > 0 && tp1 < pi/2
        if tpdiff > 0 && tp2 < pi + tp1
            if t1diff >= pi/2 - 0.1 && t1diff <= pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff >= -pi/2 - 0.1 && t2diff <= -pi/2 + 0.1 
                n2 = -n2;
            elseif t2diff >= 3*pi/2 - 0.1 && t2diff <= 3*pi/2 + 0.1 
                n2 = -n2;
            end
        else
            if t1diff >= 3*pi/2 - 0.1 && t1diff <= 3*pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff == -3*pi/2 - 0.1 && t2diff <= -3*pi/2 + 0.1
                n2 = -n2;
            end
        end
    elseif tp1 > pi/2 && tp1 < pi
         if tpdiff > 0 && tp2 < pi + tp1
            if t1diff >= pi/2 - 0.1 && t1diff <= pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff >= -pi/2 - 0.1 && t2diff <= -pi/2 + 0.1
                n2 = -n2;
            end
        else
            if t1diff >= -pi/2 - 0.1 && t1diff <= -pi/2 + 0.1    
            n1 = -n1;
            end
            if t2diff >= -pi/2- 0.1 && t2diff <= -pi/2 + 0.1
                n2 = -n2;
            end
        end
    elseif tp1 > pi && tp1 < 3*pi/2
         if tpdiff < 0 && tp2 > tp1 - pi
            if t1diff >= -pi/2 - 0.1 && t1diff <= -pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff >= pi/2 - 0.1 && t2diff <= pi/2 - 0.1
                n2 = -n2;
            end
        else
            if t1diff >= pi/2 - 0.1 && t1diff <= pi/2 - 0.1
            n1 = -n1;
            end
            if t2diff >= -pi/2 - 0.1 && t2diff <= -pi/2 + 0.1
                n2 = -n2;
            end
        end
    elseif tp1 > 3*pi/2 && tp1 < 2*pi
        if tpdiff < 0 && tp2 > tp1 - pi
            if t1diff >= -pi/2 - 0.1 && t1diff <= -pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff >= pi/2 - 0.1 && t2diff <= pi/2 - 0.1
                n2 = -n2;
            end
        else
            if t1diff >= -3*pi/2 - 0.1 && t1diff <= -3*pi/2 + 0.1   
            n1 = -n1;
            end
            if t2diff >= 3*pi/2 - 0.1 && t2diff <= 3*pi/2 + 0.1   
                n2 = -n2;
            elseif t2diff >= -pi/2 - 0.1 && t2diff <= -pi/2 + 0.1
                n2 = -n2;
            end
        end
    end
    
    inside_cone = [];
    for i = 1:length(xv)
        vec = [xv(i)-px , yv(i)-py];
        if dot(vec,n1)<0 && dot(vec,n2)<0
            inside_cone = [inside_cone,i];
        end
    end      
end
dist0 = [];
dist1 = [];
sort_cone= [];
%sort i based on distance to xint1 , yint1

if length(inside_cone) == 2
    for k =1: length(inside_cone)
    dist0 = [dist0,norm([xv(inside_cone(k))- xint1 , yv(inside_cone(k))- yint1])];
    end
    [~,inside_cone] = sort(dist0);
elseif length(inside_cone) == 3
    dist0 = [xv(inside_cone)- xint1 , yv(inside_cone)- yint1];
    dist1 = [xv(inside_cone)- xint2 , yv(inside_cone)- yint2];
    for k =1: length(inside_cone)
    dist0(k,3) = norm(dist0(k,1:2));
    dist1(k,3) = norm(dist1(k,1:2));
    end
    [~,m1] = min(dist0(:,3));
    [~,m2] = min(dist1(:,3));
    sort_cone = [m1 , 0 , m2];
    for k =1: length(inside_cone)
        if inside_cone(k) ~= m1 && inside_cone(k) ~= m2
            sort_cone(2) = inside_cone(k);
        end
    end
    inside_cone = [sort_cone];
end

%
if isempty(inside_cone)
    vo_poly = polyshape([px,xint1,xint2,px],[py,yint1,yint2,py]);    
elseif length(inside_cone) == 1
    vo_poly = polyshape([px,xint1,sq_x(inside_cone(1)),xint2,px],[py,yint1,sq_y(inside_cone(1)),yint2,py]);
elseif length(inside_cone) == 2
    vo_poly = polyshape([px,xint1,sq_x(inside_cone(1)),sq_x(inside_cone(2)),xint2,px],[py,yint1,sq_y(inside_cone(1)),sq_y(inside_cone(2)),yint2,py]);
elseif length(inside_cone) == 3
    vo_poly = polyshape([px,xint1,sq_x(inside_cone(1)),sq_x(inside_cone(2)),sq_x(inside_cone(3)),xint2,px],[py,yint1,sq_y(inside_cone(1)),sq_y(inside_cone(2)),sq_y(inside_cone(3)),yint2,py]);
end

end