function [c,ceq] = getsideConstraints(agents,i, u, dt)
c = [];
ceq = [];
freespace = agents(i).freespace;
if agents(i).side == 0
    velocityspace = agents(i).rshape;
elseif agents(i).side == 1
    velocityspace = agents(i).lshape;
else
    velocityspace = freespace;
end

vel = [u(1) + agents(i).position(1) , u(2) + agents(i).position(2)];
if ~isempty(agents(i).obs)
for k = 1:length(agents(i).obs)
   
    
    xvo = agents(i).ospace(k).Vertices(:,1);
    yvo = agents(i).ospace(k).Vertices(:,2);
    
    vo_apex = [xvo(1) yvo(1)];
    pint1 = [xvo(2) yvo(2)];
    pint2 = [xvo(3) yvo(3)];
    
    p1 = (pint1 - vo_apex)/norm((pint1 - vo_apex));
    p2 = (pint2 - vo_apex)/norm((pint2 - vo_apex));
    
    n1 = [p1(2) -p1(1)];
    n2 = [p2(2) -p2(1)];
    
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
            end
        end
    end
    
    c(end+1) = -1 * (dot(vel-vo_apex,n1));
    c(end+1) = -1 * (dot(vel-vo_apex,n2));
    
end
end
velocity = agents(i).velocity;
vel_norm = velocity / norm(velocity);
norm_vel = [vel_norm(2) -vel_norm(1)];

if agents(i).side == 0
    c(end+1) =  -1*(dot(vel-agents(i).position,norm_vel));
elseif agents(i).side == 1
    c(end+1) =  -1*(dot(vel-agents(i).position,-norm_vel));
end

end