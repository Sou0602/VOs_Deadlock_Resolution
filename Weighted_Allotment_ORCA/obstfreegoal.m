function out = obstfreegoal(agents,i)
% obstfreegoal - Checks for conditions in the vicinity of an agent and
% qualifies if there is a path to the goal without any obstacles
% obstructing the path.
%
% Syntax: out_flag = obstfreegoal(agents,i)
%  
out = 0;
flags = zeros(1,length(agents(i).obs));
oflags = zeros(1,length(agents(i).obs));
for k = 1:length(agents(i).obs)
    oname = str2double(agents(i).obs(k));
    obs = agents(oname);
    goal = agents(i).goal;
    opos = obs.position;
    ix = agents(i).position(1);
    iy = agents(i).position(2);
    px = opos(1);
    py = opos(2);
    i2g = goal - [ix,iy];
    g2i = -i2g;
    i2p = [px,py] - [ix,iy];
    g2p = [px,py] - goal;
    
    if dot(i2p,i2g) > 0 && dot(g2p,g2i) > 0
    
    a = agents(i).goal(1) - agents(i).position(1);
    b = agents(i).goal(2) - agents(i).position(2);
    c = sqrt(a^2 + b^2);
    a = a/c;
    b = b/c;


    
    ny = (a*b*(px - ix) + b^2 * py + a^2 * iy )/ (a^2 + b^2);
    nx = px - (b/a) * (ny - py);
    normdis = sqrt((nx - px)^2 + (ny - py)^2);
    
    if normdis > 2.2*(agents(i).radius) && obs.gflag == 1
        flags(k) = 1;
    end
    end
    
    if (obs.gflag == 1 && dot(i2p,i2g) < 0) ||(obs.gflag == 1 && dot(g2p,g2i) < 0)
        flags(k) = 1;
    end
    
    if obs.gflag == 0 && norm(i2g) <= 5*agents(i).radius 
        if dot(i2p,i2g) > 0 && dot(g2p,g2i) > 0 && normdis > 2.2* agents(i).radius
            flags(k) = 1;
        elseif ( dot(i2p,i2g) < 0 || dot(g2p,g2i) < 0 ) 
            flags(k) = 1;
        end 
    end
    
    if obs.gflag == 1 && norm(agents(i).velocity) < 0.1*agents(i).vmax 
         if dot(i2p,i2g) > 0 && dot(g2p,g2i) > 0 && normdis < 2.2* agents(i).radius
             oflags(k) = 1;
         end
    end
    
    
end
   
if sum(flags) == length(agents(i).obs) && length(agents(i).obs) > 0
    out = 1;
end
if sum(oflags) == length(agents(i).obs) && ~isempty(agents(i).obs)
    out = 2;
end

end