agents = [
    addAgent('1', [-5,-5], [0 0], [5,5],1),
 %   addAgent('2', [5 -5],   [0 0 ], [-5 5],1),
 %   addAgent('3', [-5 5],  [0 0 ], [5 -5],1),
    addAgent('2', [5,5],  [0 0], [-5 ,-5],1),
    addAgent('3', [-5 5],  [0 0 ], [5 -5],1),
    ];

dt = 0.1;
counter = 0;
axisLimits = [-12 12 -12 12]/2;
maxIterations = 500;

while counter < maxIterations

    for i = 1:length(agents)
     if(agents(i).gflag ~= 1) 
        obstacles = [];
        for j = 1:length(agents)
            if i ~= j
                if inSensorRange(agents(i), agents(j))
                    obstacles = [obstacles; agents(j).name];
                end
            end
        end
        agents(i).obs = obstacles;
     end
    end
sides = [];
    for m = 1 :length(agents)
       
    agents(m).path = [agents(m).path ; agents(m).position];
    
  %  if isempty(agents(m).obs)
      %agents(m).velocity = ((agents(m).goal - agents(m).position) / norm(agents(m).goal - agents(m).position)) * agents(m).vmax;
      %agents(m).position = agents(m).position + agents(m).velocity * dt;
      if isempty(agents(m).obs)
      agents(m).side = 2;
     
      else
          %
        %
       px = agents(m).position(1);
       py = agents(m).position(2);
       vm = agents(m).vmax;
       agents(m).sqpoly = polyshape([px-vm,px-vm,px+vm,px+vm],[py-vm,py+vm,py+vm,py-vm]);
       agents(m).ospace = [];
       for n = 1 : length(agents(m).obs)
           xint1 = 0;
           yint1 = 0;
           xint2 = 0;
           yint2 = 0;
           oname = str2double(agents(m).obs(n));
           obstacle = agents(oname);
           [x1,y1,x2,y2]=CC(agents(m).position, obstacle.position, agents(m).radius + obstacle.radius, agents(m).radius);
           [x1o,y1o,x2o,y2o] = VO(x1,y1,x2,y2,obstacle.velocity);
           [xint1,yint1] = getintersection(x1o,y1o,agents(m).sqpoly);
           [xint2,yint2] = getintersection(x2o,y2o,agents(m).sqpoly);
     %%       agents(m).obs(n).vospace = constructpoly(agents(m).position + obstacle.velocity,xint1,yint1,xint2,yint2);
           if n == 1
           agents(m).vospace = constructpoly(agents(m).position + obstacle.velocity,xint1,yint1,xint2,yint2);
           agents(m).ospace  = [agents(m).ospace;agents(m).vospace];
           elseif n > 1
           ospace = constructpoly(agents(m).position + obstacle.velocity,xint1,yint1,xint2,yint2);
           agents(m).ospace = [agents(m).ospace;ospace];
           agents(m).vospace = union(agents(m).vospace,ospace);
           end
           obstacle = [];
       end
    %end
        %Construct vo spaces with all the obstacles
%%%%
%if ~isempty(agents(m).obs)
%{
agents(m).vospace = agents(m).obs(1).vospace;
if length(agents(m).obs)> 1
    for i = 1 : length(agents(m).obs) - 1
    agents(m).vospace = union(agents(m).vospace,agents(m).obs(i+1).vospace);
    end
end
%}
%%%%%%%%%
agents(m).freespace = agents(m).sqpoly;
agents(m).freespace = subtract(agents(m).freespace,agents(m).vospace);

%end
%%%%%%%%%%%%%%
%{
hold on
plot(agents(m).freespace);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Allotment

[agents(m).rshape , agents(m).lshape] = dividevshape(agents(m));
 [xc,yc] = centroid(agents(m).rshape);
 agents(m).rcentroid = [xc,yc];
 [xc,yc] = centroid(agents(m).lshape);
 agents(m).lcentroid = [xc,yc];
 tdivide = toc(tic);
 disp(m);
 disp(tdivide);
   

% Sampling approach
%{
varea = 0;
areac = 1;
ac = 0;
td = 100;
while ac < areac
%% findv
vx = -agents(m).vmax + 2*agents(m).vmax * rand(1) + agents(m).position(1);
vy = -agents(m).vmax + 2*agents(m).vmax * rand(1) + agents(m).position(2);
v = [vx,vy];
[infreespace,~] = inpolygon(v(1),v(2),agents(m).freespace.Vertices(:,1),agents(m).freespace.Vertices(:,2)) ;
if infreespace == 1
    agents(m).vocone = getvcone(v,agents(m),dt);
    agents(m).vspace = intersect(agents(m).freespace,agents(m).vocone);

    if agents(m).vspace.NumRegions == 1 && agents(m).vspace.NumHoles == 0
        agents(m).vocone = agents(m).vocone;
        agents(m).vspace = agents(m).vspace;
        varea = area(agents(m).vspace);
        vcn = agents(m).velocity/norm(agents(m).velocity);
        vn = v/norm(v);
        thetadiff = norm(vcn - vn);
        %
        if varea >= agents(m).varea
             agents(m).varea = varea;
             agents(m).velocity_sample = [v(1)-agents(m).position(1) , v(2) - agents(m).position(2)];
             %ac = ac + 1;
        end
        %
        %{
        if thetadiff < td
            td = thetadiff;
            agents(m).velocity_sample = [v(1)-agents(m).position(1) , v(2) - agents(m).position(2)];
            ac = ac+ 1;
        end
        %}
    ac = ac+ 1;
    end
end 
end
%}

%agents(m).velocity =  5* 0.2*agents(m).velocity_sample + 0*0.8*agents(m).velocity; % Weighted sum does not guarentee collision avoidance.
%agents(m).position = agents(m).position + agents(m).velocity * dt;
      
    
    %}
      end
    end
    %
sides = allotment_weights(agents);

    for i = 1 : length(agents)
        if ~isempty(sides)
        agents(i).side = sides(i);
        end
    end
    %}
    for i = 1 : length(agents)
        if agents(i).side == 2
            agents(i).velocity = ((agents(i).goal - agents(i).position) / norm(agents(i).goal - agents(i).position)) * agents(i).vmax;
        else
        
        
        agents(i).velocity = getControls(agents,i,dt);
       
        %%%%%%%
       %Sampling
       %{
        phi = 1/180 + atan2(agents(i).velocity(2),agents(i).velocity(1));
        while true
       % vx = -agents(i).vmax + 2*agents(i).vmax * rand(1) + agents(i).position(1);
       % vy = -agents(i).vmax + 2*agents(i).vmax * rand(1) + agents(i).position(2);
      %  v = [vx,vy];
      
     
      if abs(phi - atan2(agents(i).velocity(2),agents(i).velocity(1))) <= 1/6
            if agents(i).side == 0
                vrot = ([cos(phi) -sin(phi) ; sin(phi) cos(phi)] * agents(i).velocity' )' + agents(i).position;
                vx = vrot(1);
                vy = vrot(2);
                v = [vx,vy];
                [in,~] = inpolygon(vx,vy,agents(i).rshape.Vertices(:,1),agents(i).rshape.Vertices(:,2));
                if in == 1 
                    agents(i).velocity = v - agents(i).position;
                    break
                end
             phi = phi + 1/180;
             
            elseif agents(i).side == 1
             phi = -1/180 + atan2(agents(i).velocity(2),agents(i).velocity(1));
             vrot = ([cos(phi) -sin(phi) ; sin(phi) cos(phi)] * agents(i).velocity' )' + agents(i).position;
             vx = vrot(1);
             vy = vrot(2);
             v = [vx,vy];
             
            [in,~] = inpolygon(vx,vy,agents(i).lshape.Vertices(:,1),agents(i).lshape.Vertices(:,2));
                if in == 1 
                    agents(i).velocity = v - agents(i).position;
                    break
                end
                phi = phi - 1/180;
            end
        
      else
        agents(i).velocity = agents(i).velocity * 0.8;
        if agents(i).side == 0
        phi = 1/180 + atan2(agents(i).velocity(2),agents(i).velocity(1));
        else
              phi = -1/180 + atan2(agents(i).velocity(2),agents(i).velocity(1));
        end
      end
        end
       %}
        %%%%%%%%
         
         
        % disp(exitflag);
        end
       agents(i).position = agents(i).position + agents(i).velocity * dt;
    end
    
    plotSimulation(agents, counter, dt, axisLimits, false);
    counter = counter + 1;
  
end

%construct a loop to repeat for other agents
