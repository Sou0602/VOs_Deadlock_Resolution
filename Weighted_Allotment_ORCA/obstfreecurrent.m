function out = obstfreecurrent(agents,i)
% obstfreegoal - Checks for conditions in the vicinity of an agent and
% qualifies if the agent has to continue moving in the current direction
% that it has. This might get overridden by the control in the outerloop.
% This flag was introduced to intercede, problematic controls observed in
% ORCA convergence around static obstacles.
%
% Syntax: out_flag = obstfreecurrent(agents,i)
%  
out = 0;
flags = zeros(1,length(agents(i).obs));
for k = 1:length(agents(i).obs)
    oname = str2double(agents(i).obs(k));
    obs = agents(oname);
    goal = agents(i).position + agents(i).velocity;
    opos = obs.position;
    ix = agents(i).position(1);
    iy = agents(i).position(2);
    px = opos(1);
    py = opos(2);
    

    

    
    a = agents(i).goal(1) - agents(i).position(1);
    b = agents(i).goal(2) - agents(i).position(2);
    c = sqrt(a^2 + b^2);
    a = a/c;
    b = b/c;


    
    ny = (a*b*(px - ix) + b^2 * py + a^2 * iy )/ (a^2 + b^2);
    nx = px - (b/a) * (ny - py);
    normdis = sqrt((nx - px)^2 + (ny - py)^2);
    
    if obs.gflag == 1 && normdis > 2.5 * agents(i).radius
       flags(k) = 1;
    end
    
    if obs.gflag == 1 && norm(agents(i).velocity) < 0.1 * agents(i).vmax && norm([ix-px,iy-py]) > 4.2*agents(i).radius
        flags(k) = 1;
    end
end
   
if sum(flags) == length(agents(i).obs) && length(agents(i).obs) > 0 && agents(i).pflag ~= 3
    out = 1;
end
end