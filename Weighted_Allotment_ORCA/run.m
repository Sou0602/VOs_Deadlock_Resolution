clc ;
clear all ;


%{
agents = [
    addAgent('1', [-5,-5], [0 0], [5,5],1),
    addAgent('2', [5 -5],   [0 0 ], [-5 5],1),
    addAgent('3', [-5 5],  [0 0 ], [5 -5],1),
    addAgent('4', [5,5],  [0 0], [-5 ,-5],1),
    ];
%}
%dconfig1
%1,0.3,4
%{
agents1=[
     addAgent('1', [-8 0], [0 0], [8 0],1),
     addAgent('2', [-6 4],   [0 0], [6 -8],1),
     addAgent('3', [-6 -3],     [0 0], [8 3],1),
     addAgent('4', [0 -8],  [0 0], [0 8],1),
     addAgent('5', [-3 -6],  [0 0 ], [8 7],1), 
     addAgent('6', [4 -7],  [0 0 ], [-4 8],1), 
     addAgent('7', [3 6],  [0 0 ], [3 -6],1), 
     addAgent('8', [5 -6],  [0 0 ], [5 7],1), 
     addAgent('9', [-3 6],  [0 0 ], [-3 -6],1), 
];
%}

%3v2
%{
agents = [
     addAgent('1', [-8 2.5], [0 0], [5 2.5],1),
     addAgent('2', [5 1.5],   [0 0], [-5 1.5],1),
     addAgent('3', [-8 0],  [0 0], [5 0],1),
     addAgent('4', [5 -1.5],  [0 0], [-5 -1.5],1),
     addAgent('5', [-8 -2.5],  [0 0], [5 -2.5],1), 
];
%}

% 4 , 0.3 , forced direction , 8.5 - config2
%{
agents=[
     addAgent('1', [-6 -2], [0 0], [4 2],1),
     addAgent('2', [-5 3],   [0 0], [4 -3],1),
     addAgent('3', [-4 -4],     [0 0], [2 4],1),
     addAgent('4', [4 0],  [0 0], [-8 0],1),
     addAgent('5', [4 -2],  [0 0], [-7 2],1), 
     addAgent('6', [2 -4],  [0 0], [-1 5],1), 
     addAgent('7', [5 2] , [0 0] , [-4 2],1),
     addAgent('8', [-2 -4],  [0 0], [-5 5],1)
];
%}
%config7
%{
% 1 , 0.3 ,4
agents=[
     addAgent('1', [-6 -2], [0 0], [4 2],1),
     addAgent('2', [-4 1],   [0 0], [3 -3],1),
     addAgent('3', [-4 -4],     [0 0], [2 4],1),
     addAgent('4', [2 0],  [0 0], [-8 0],1),
     addAgent('5', [2 -2],  [0 0], [-6 0],1), 
     addAgent('6', [0 -4],  [0 0], [-1 5],1), 
     addAgent('7', [-2 -4],  [0 0], [-4 5],1),
     addAgent('8', [2 -3.5],  [0 0], [-2 2.5],1),
     addAgent('9', [1.5 1.5],     [0 0], [-6 -4],1),
];
%}
% 1 , 0.3 , 4.5 - config8
%{
agents=[
     addAgent('1', [-1 -5], [0 0], [7 0],1),
     addAgent('2', [10 3],   [0 0], [-5 -3],1),
     addAgent('3', [11 -1],  [0 0], [-2 -3],1),
     addAgent('4', [3 4],  [0 0], [8 -8],1),
     addAgent('5', [3 -6],  [0 0], [3 6],1), 
     addAgent('6', [4 -5],  [0 0], [1 4],1), 
     addAgent('7', [9 0],  [0 0], [-4 2],1),
     addAgent('8', [-2 -1],  [0 0], [9 -4],1),  
];
%}
%4s_start
%{
agents1=[
     addAgent('1', [-8 0], [0 0], [8 0],1),
     addAgent('2', [-6 4],   [0 0], [6 -8],1),
     addAgent('3', [-6 -3],     [0 0], [8 3],1),
     addAgent('4', [0 -8],  [0 0], [0 8],1),
     addAgent('5', [-3 -6],  [0 0 ], [8 7],1), 
     addAgent('6', [4 -7],  [0 0 ], [-4 8],1), 
     addAgent('7', [3 6],  [0 0 ], [3 -6],1), 
     addAgent('8', [5 -6],  [0 0 ], [5 7],1), 
     addAgent('9', [-3 6],  [0 0 ], [-3 -6],1), 
];
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configurations specially for parallel deadlocks
%parallel1
%{
agents = [
     addAgent('1', [-3 -3], [0 0], [3 3],1),
     addAgent('2', [-3 3],   [0 0], [3 9],1),
     addAgent('3', [0 -3],     [0 0], [0 10],1),
     addAgent('4', [-6 9],  [0 0], [3 -2],1), 
];
%}
%parallel2
%{
agents = [
     addAgent('1', [-3 -3], [0 0], [3 10],1),
     %addAgent('2', [-3 3],   [0 0], [3 9],1),
     addAgent('2', [0 -3],     [0 0], [-5 10],1),
     %addAgent('4', [-6 9],  [0 0], [3 -2],1), 
];
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4,1,0.3 - config 10
%{
agents=[
     addAgent('1', [-4 0], [0 0], [8 0],1),
     addAgent('2', [-3 2],   [0 0], [7 -7],1),
     addAgent('3', [-4 -3],     [0 0], [8 3],1),
     addAgent('4', [1 -6],  [0 0], [1 8],1),
     addAgent('5', [-3 -6],  [0 0], [7 5],1), 
     addAgent('6', [4 -7],  [0 0], [-1 4],1), 
     addAgent('7', [3 4],  [0 0], [1 -6],1), 
     addAgent('8', [6 -5],  [0 0], [-1 6],1), 
     addAgent('9', [1 6],  [0 0], [-2 -6],1), 
];
rot = [0 1 ; -1 0];
for i = 1:length(agents)
    agents(i).initialpos = agents(i).position*rot;
    agents(i).position = agents(i).position*rot;
    agents(i).goal = agents(i).goal*rot;
    agents(i).phi=atan2((agents(i).goal(2)-agents(i).position(2)),(agents(i).goal(1)-agents(i).position(1)));
end

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%config9 - 4.5
%{
agents=[
     addAgent('1', [-6 0], [0 0], [8 0],1),
     addAgent('2', [-3 3],   [0 0], [5 -6],1),
     addAgent('3', [-4 -3],     [0 0], [8 3],1),
     addAgent('4', [1 -6],  [0 0], [1 8],1),
     addAgent('5', [-3 -6],  [0 0], [7 5],1), 
     addAgent('6', [4 -7],  [0 0], [-3 5],1), 
     addAgent('7', [4 6],  [0 0], [1 -6],1), 
     addAgent('8', [6 -5],  [0 0], [-1 6],1), 
     addAgent('9', [-1 6],  [0 0], [-1 -6],1), 
];
%}
%load('agents_test_c10.mat')
%load('agents_c10_19s.mat')

%% For cases where using pre-saved models, from a previous run, follow this convention.
%% Name configuration above as agents1 and then update the parameters.
%{
load('agents_2.4s_config2.mat')
for i = 1:length(agents)
    agents1(i).position = agents(i).position;
    agents1(i).velocity = agents(i).velocity;
end
    clear agents;
    agents = agents1;
    clear agents1;
    %}
%%
dt = 0.1;
counter = 0;
axisLimits = [-12 12 -12 12]/1.5;
maxIterations = 1000;
Sides = [];
rws = [];
lws = [];
zws = [];
Pflag = [];
Velnorm = [];

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
        agents(i).pflag = 0;
        agents(i).pobs = 0;
        agents(i).fflag = 0;
     else
         agents(i).obs = [];
     end
    end
    
    %agents(i).bobs = [] is a list that keeps note of the obstacles that
    %are in front of the agent in an instance
  for i = 1:length(agents)
         agents(i).bobs = [];
        if ~isempty(agents(i).obs) 
          for j=1:length(agents(i).obs)
            oname = agents(i).obs(j);
            k = str2double(oname);
            relative_dist = agents(k).position - agents(i).position;
            nor_rel_dist = norm(relative_dist);
            unit_rel_dist = relative_dist/nor_rel_dist;
            kvel_dist = dot(agents(k).velocity,unit_rel_dist)*(unit_rel_dist);
            ivel_dist = dot(agents(i).velocity,unit_rel_dist)*(unit_rel_dist);
            rel_vel_dist = ivel_dist - kvel_dist;
            ttc = nor_rel_dist / norm(rel_vel_dist);
            % ttc - time to collision , is the measure of time to collision
            % between the agents. We have a dt of 0.1s for an iteration. So
            % large values of ttc indicates, agents moving parallel to each
            % other
            if ttc > 25
            if dot(relative_dist,agents(i).velocity) > 0
                agents(i).bobs = [agents(i).bobs,k];
            end
            end
          end
        end
    end
    
    for i = 1:length(agents)
        for j=1:length(agents(i).bobs)
            k = agents(i).bobs(j);
            distfromgoal = norm(agents(i).goal - agents(i).position);
            % The agents are given pflags to resolve the conditions of a
            % parallel deadlock scenario. It is observed when ttc > 25, as
            % a measure. But this value can be toggled around. If a
            % parallel deadlock is recorded, the agent with less number of
            % obstacles ahead of it, is given preference to get scaled
            % up(accelerated) to resolve the parallel deadlock
            if counter > 50 && agents(k).gflag == 0
                %We start checking for parallel deadlocks, only after
                %sometime into the configuration. Hence, the value of "50"
                %here is dependent on the configuration. 
                % Parallel Deadlocks are usually observed more in congested
                % scenarios and cases, where atleast some of the agents
                % returned to their goals and other are obstructed from
                % their goals.
            if length(agents(k).bobs) < length(agents(i).bobs) || isempty(agents(k).bobs)
                agents(i).pflag = 1;
                agents(i).pobs = k;
            elseif length(agents(i).bobs) == length(agents(k).bobs) 
                agents(i).pflag = 2;
                agents(i).pobs = k;
            end
            end
        end
        %This function is used for cases where there are no obstacles
        %around it and to reduce distracting away from the goal. It checks
        %for a condition and if satisfies, raises a flag to move towards
        %its goal direction
        if obstfreegoal(agents,i) 
            agents(i).pflag = 3;
        end
        
        %This funciton checks for conditions to keep moving in its
        %current velocity direction. This flag is used to check and correct
        %if the behavior is not as expected. For example, when fmincon does
        %not converge to a solution etc.
        if obstfreecurrent(agents,i)
            agents(i).pflag = 4;
        end
        %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % The section below is a check to change the curvature parameters for a
    % faster convergence to the goal once the deadlock like congestion is
    % avoided. For a simple understanding, once the agent is outside a
    % scaled up version of a convex hull of all the other agents including
    % their starting and goal positions, then a flag is raised to continue
    % moving with a higher curvature to the goal . This condition is to
    % ensure that the agent is relatively far from other agents.
    nagents = agents;
    nagents(i) = [];
    nax = [];
    nay = [];
    for j = 1:length(nagents)
       nax = [nax,nagents(j).position(1),nagents(j).goal(1)]; 
       nay = [nay,nagents(j).position(2),nagents(j).goal(2)];
    end
    nchull = convhull(nax,nay);
    ncpoly = polyshape(nax(nchull),nay(nchull));
    [cx,cy] =centroid(ncpoly);
    distances = sqrt((ncpoly.Vertices(:,1) - cx).^2 + (ncpoly.Vertices(:,2) - cy).^2);
    [im , maxval ] = max(distances);
    scalef = (maxval + 2.5*agents(i).radius)/maxval;
    ncpoly = scale(ncpoly,scalef);
    nvx = ncpoly.Vertices(:,1);
    nvy = ncpoly.Vertices(:,2);
    pax = [];
    pay = [];
    for k = 1:length(agents)
        pax = [pax,agents(k).initialpos(1),agents(k).goal(1)];
        pay = [pay,agents(k).initialpos(2),agents(k).goal(2)];
    end
    conpolyhull = convhull(pax,pay);
    conpoly = polyshape(pax(conpolyhull),pay(conpolyhull));
    [cax,cay] =centroid(conpoly);
    distances1 = sqrt((conpoly.Vertices(:,1) - cax).^2 + (conpoly.Vertices(:,2) - cay).^2);
    [im1 , maxval1 ] = max(distances1);
    scalef1 = (maxval1 + 2.5*agents(i).radius)/maxval1;
    conpoly = scale(conpoly,scalef1);
    cvx = conpoly.Vertices(:,1);
    cvy = conpoly.Vertices(:,2);
    [cin , con ] = inpolygon(agents(i).position(1),agents(i).position(2),cvx , cvy);
    [nin,non] = inpolygon(agents(i).position(1),agents(i).position(2),nvx , nvy);
    
    if (nin == 0 && non == 0 && counter > 5)|| (cin == 0 && con == 0)
      
        agents(i).outflag = 1;
    
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    %}
sides = [];
rws = [];
lws = [];

    for m = 1 :length(agents)
      if(agents(m).gflag ~= 1) 
        if isempty(agents(m).obs) || (agents(m).pflag == 3 && Pflag(end,m) == 3 && agents(i).outflag == 1)
            %% If there are no obstacles or if the agents is relatively far from all its agents 
            %% and has the flag to move to move towards its goal, then the agent is given side = 2.
            %% Side = 2 is equivalent to directly computing the control to move towards goal
      agents(m).side = 2;
      elseif agents(m).orflag == 1
          agents(m).side = 3;
        else
          %% Regular update -  In case of non-goal control
       px = agents(m).position(1);
       py = agents(m).position(2);
       vm = agents(m).vmax * 1.5;
       %% Define a freespace in the shape of a square in the velocity freespace with a polyshape
       agents(m).sqpoly = polyshape([px-vm,px-vm,px+vm,px+vm],[py-vm,py+vm,py+vm,py-vm]);
       agents(m).ospace = [];
       agents(m).volegs = [];
       
       for p = 1 : length(agents(m).obs)
           xint1 = 0;
           yint1 = 0;
           xint2 = 0;
           yint2 = 0;
           oname = str2double(agents(m).obs(p));
           obstacle = agents(oname);
           %% The function CC computes the Collision Cone for each agent obstacle pair
           [x1,y1,x2,y2]=CC(agents(m).position, obstacle.position, (agents(m).radius + obstacle.radius)*1.12, agents(m).radius);
           %% Transform the Collision cone to Velocity Obstacle using the VO function
           [x1o,y1o,x2o,y2o] = VO(x1,y1,x2,y2,obstacle.velocity);
           x1o(1) = agents(m).position(1) + obstacle.velocity(1);
           y1o(1) = agents(m).position(2) + obstacle.velocity(2);
           x2o(1) = agents(m).position(1) + obstacle.velocity(1);
           y2o(1) = agents(m).position(2) + obstacle.velocity(2);
           agents(m).volegs = [agents(m).volegs ; x1o(1) , y1o(1) ,x1o(2),y1o(2), x2o(2) , y2o(2)];
           %% Compute intersection of the Velocity Obstacle with the freespace square defined
           %% getintersection - computes the intersection for each leg of the cone separately
           [xint1,yint1] = getintersection(x1o,y1o,agents(m).sqpoly);
           [xint2,yint2] = getintersection(x2o,y2o,agents(m).sqpoly);
           
           if p == 1
               %% Initialising for the first agent - obstacle pair
               %% agents(m).vospace - Polyshape of the union of VO's lying inside the alloted square
               %% agents(m).ospace - List of the individual VO for each obstacle for an agent
            agents(m).vospace = constructpoly(agents(m),agents(m).position + obstacle.velocity,xint1,yint1,xint2,yint2);
            agents(m).ospace  = [agents(m).ospace;agents(m).vospace];
           
           elseif p > 1
           ospace = constructpoly(agents(m),agents(m).position + obstacle.velocity,xint1,yint1,xint2,yint2);
           agents(m).ospace = [agents(m).ospace;ospace];
           agents(m).vospace = union(agents(m).vospace,ospace);
         
           end
           obstacle = [];
       end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define the remaining region after subtracting the Velocity obstacle as the 
%% freespace in the velocity space
agents(m).freespace = agents(m).sqpoly;
agents(m).freespace = subtract(agents(m).freespace,agents(m).vospace);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Divide the velocity freespace based on the current velocity direction into left and right regions
[agents(m).rshape , agents(m).lshape] = dividevshape(agents(m));
 [xc,yc] = centroid(agents(m).rshape);
 agents(m).rcentroid = [xc,yc];
 [xc,yc] = centroid(agents(m).lshape);
 agents(m).lcentroid = [xc,yc];
 
    end
      else
        %% If no obstacles
    agents(m).freespace = agents(m).sqpoly;
    agents(m).side = 2;
    end
    end
%% The allotment_weights outputs the sides for each obstacles
%% rws are sides which are alloted right side, lws for left and zws for preference to ORCA alloted side
[sides,rws,lws,zws] = allotment_weights(agents,counter);
Sides = [Sides;sides];
agents(i).rws = [];
agents(i).lws = [];
agents(i).zws = [];
    for i = 1 : length(agents)
        if ~isempty(sides)
        agents(i).side = sides(i);
        end
        agents(i).rws = rws(i,:);
        agents(i).lws = lws(i,:);
        agents(i).zws = zws(i,:);
    end
    

    for i = 1 : length(agents)

        if agents(i).gflag ~= 1
        if agents(i).side == 2
            %% Control to move in the direction of goal
            agents(i).newControl = ((agents(i).goal - agents(i).position) / norm(agents(i).goal - agents(i).position)) * agents(i).vmax;
        else
            %% If in case the agent violates the velocity due to an optimization issue and has the flag to move
            %% in its current direction
            %% agents(i).fflag indicates the command to always choose the alloted side, instead of an ORCA side.
            %% This flag is used rarely to deal with cases where ORCA optimization may lead to non-convergence.
            if agents(i).pflag == 4 && norm(agents(i).velocity) < 0.2*agents(i).vmax
                agents(i).fflag = 1;
            end
        %% Update to get the Controls
        agents(i).newControl = getControls(agents,i,dt,counter);
          
        end
        
   
        if counter > 1
        %% Analysis of Velocity by visualising Collision Cones.
        vel_an(agents,i,sides);
        end
    
        goaldist = norm(agents(i).position - agents(i).goal);
        if goaldist < agents(i).radius*1
            agents(i).gflag = 1;
        end
        else
            agents(i).gflag = 1;
            agents(i).newControl = [0,0];
        end
        
    end
    pflag = [];
    for i = 1:length(agents)
     %%%%%%%%%%%%%%%%%%%%%%%%%%
        %%if parallel deadlock exists
        s = 2; % Scaling factor
        %  
        if agents(i).pflag == 1
        pobs = agents(i).pobs; % Parallel obstacles - in a deadlock scenario
        agents(i).newControl = agents(i).newControl/s; %Scaled down
        agents(pobs).newControl = (agents(pobs).newControl/norm(agents(pobs).newControl)) * min(norm(agents(pobs).newControl)*s,agents(pobs).vmax);
        %}
    elseif agents(i).pflag == 2
        %% This is for cases where both the agents have a similar encironment, preference is given to 
        %% the agent which is nearer to its goal.
        pobs = agents(i).pobs;
        distfromgoal_i = norm(agents(i).goal - agents(i).position);
        distfromgoal_k = norm(agents(pobs).goal - agents(pobs).position);
        if distfromgoal_i > distfromgoal_k
        agents(i).newControl = (agents(i).newControl/norm(agents(i).newControl)) * min(norm(agents(i).newControl)*s,agents(i).vmax);
        agents(pobs).newControl = agents(pobs).newControl/s;
        elseif distfromgoal_i < distfromgoal_k
        agents(pobs).newControl = (agents(pobs).newControl/norm(agents(pobs).newControl)) * min(norm(agents(pobs).newControl)*s,agents(pobs).vmax);
        agents(i).newControl = agents(i).newControl/s;
        end
        elseif agents(i).pflag == 3 && Pflag(end,i) == 3 && agents(i).outflag == 1
       %% This condition is where agent is relatively far away from other obstacles and has the flag to move towards 
       %% its goal direction. It is helpful to overlap the control in case of forced flags. This ensures that, agents 
       %% which are very far away do not have any impact on the allotment in cases where the local environment is free.
       agents(i).newControl = ((agents(i).goal - agents(i).position) / norm(agents(i).goal - agents(i).position)) * agents(i).vmax ;
       
        elseif agents(i).pflag == 4
        %% To override, any false controls and allotment in case of relatively free local environment.
        agents(i).newControl = agents(i).velocity;   
        %% To override any optimization issues.
        if norm(agents(i).velocity) < 0.15*agents(i).vmax
            agents(i).newControl = 0.6*agents(i).vmax * agents(i).velocity/norm(agents(i).velocity);
        end
        %}
        end

    pflag = [pflag , agents(i).pflag];
    end
    Pflag = [Pflag ; pflag];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    n=4;
    v=zeros(length(agents),n);
    w=zeros(length(agents),n);
   %% Upper and Lower bounds for a curvature constraint parameter.
        lb = 0;
        ub = 0;

    for i = 1:length(agents)

           if(agents(i).gflag~=1)
            agents(i).path = [agents(i).path; agents(i).position];
            goal_pos = futurePosition(agents(i), dt); 
           %goal_pos - The position reached following a holonomic model
            agents(i).Vh = agents(i).newControl;
           % v , w for each agent at n waypoints from current position to
           % future holonomic position
            [v(i,:),w(i,:),coeff]= vel_prof(agents(i),goal_pos,n,lb,ub);
            %% coeffs - These are curvature constraints of the mapping
            agents(i).coeff=coeff;
           end
        
    end
        
    for j=1:n
        %Updating the positions of all agents at each of the n waypoints
        %and plotting them
        
          for m=1:length(agents) 
              if(agents(m).gflag~=1)
              agents(m).path = [agents(m).path; agents(m).position];
              % To calculate distance from goal and updating the controls
              % accordingly.
              diff_vec = (agents(m).position - agents(m).goal);
              diff_sq = diff_vec.^2;
              goaldist = sqrt(sum(diff_sq));
              if goaldist > agents(m).radius*2
                  % Regular update where new positions , controls are
                  % alloted to the agent.
            [agents(m).position,agents(m).phi]=newPosition(agents(m),v(m,j),w(m,j),dt/n);
             agents(m).velocity=newVelocity(agents(m),v(m,j),agents(m).phi);
              elseif goaldist > agents(m).radius && goaldist <= 2*agents(m).radius
                  %Once the agent is very close to its goal, the agent
                  %moves in the direction to its goal and not the computed
                  %control. 
                  agents(m).velocity = ((agents(m).goal - agents(m).position) / norm(agents(m).goal - agents(m).position)) * norm( agents(m).velocity);
                  agents(m).position = agents(m).position + agents(m).velocity*dt/n;
                  agents(m).phi = agents(m).phi;
              else
                  agents(m).gflag = 1;
                  agents(m).velocity = [0,0];
              end
              else
                  agents(m).velocity = [0,0];
              end
          end
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      % Plot the simulations for all agents after each n. Hence, for a dt
      % iteration, 4 agents
      % For saving data, make sure to change the false flag to true.
      plotSimulation(agents, counter, dt, axisLimits, false);
       
    end
    counter = counter + 1;
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Check for goal convergence and tracking the velocity norm
    vel_norm = [];
    sumg = 0;
    for k = 1:length(agents)
        sumg = sumg + agents(k).gflag;
        vel_norm = [vel_norm , norm(agents(k).velocity)];
    end
    Velnorm = [Velnorm;vel_norm];
    if sumg == length(agents)
            break;
    end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end


