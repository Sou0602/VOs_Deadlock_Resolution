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
agents=[
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
%{
agents=[
     addAgent('1', [1 7], [0 0], [9 1],1),
     addAgent('2', [4 9],   [0 0], [2 -2],1),
     addAgent('3', [1 -1],     [0 0], [5 7],1),
     addAgent('4', [7 7],  [0 0], [-1 -1],1),
     addAgent('5', [-2 0],  [0 0], [9 7],1), 
     addAgent('6', [8 4],  [0 0], [-2 2],1), 
     addAgent('7', [-3 3],  [0 0], [9 3],1), 
     addAgent('8', [7 -1],  [0 0], [-1 7],1),
     addAgent('9', [-2 6], [0 0], [4 -1],1)
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
%{
agents=[
     addAgent('1', [-2 -7], [0 0], [7 0],1),
     addAgent('2', [10 3],   [0 0], [-5 -3],1),
     addAgent('3', [11 -1],  [0 0], [-2 -3],1),
     addAgent('4', [3 4],  [0 0], [8 -8],1),
     addAgent('5', [2 -8],  [0 0], [3 6],1), 
     addAgent('6', [5 -7],  [0 0], [1 4],1), 
     addAgent('7', [9 0],  [0 0], [-4 2],1),
     addAgent('8', [-3 -3],  [0 0], [9 -4],1), 
     addAgent('9', [8 5],  [0 0], [-2 -5],1),    
];
%}

%{
agents=[
     addAgent('1', [-2 -7], [0 0], [7 0],1),
     addAgent('2', [10 3],   [0 0], [-5 -3],1),
     addAgent('3', [11 -1],  [0 0], [-2 -3],1),
     addAgent('4', [3 4],  [0 0], [8 -8],1),
     addAgent('5', [2 -8],  [0 0], [3 6],1), 
     addAgent('6', [5 -7],  [0 0], [1 4],1), 
     addAgent('7', [9 0],  [0 0], [-4 2],1),
     addAgent('8', [-3 -3],  [0 0], [9 -4],1), 
];
%}
%{
agents=[
    
     addAgent('1', [-6 6],     [0 0], [10 -5],1),
     addAgent('2', [6 -8],  [0 0], [-6 6],1),
     addAgent('3', [-8 0],  [0 0], [8 0],1),  
     addAgent('4', [8 -1],  [0 0], [-6 -7],1),
    % addAgent('5', [-7 3],  [0 0], [6 3],1), 
     addAgent('5', [8 3],  [0 0], [-3 -8],1), 
     addAgent('6', [8 -6], [0 0], [-8 -6],1), %Undergoes collision with
  %   this agent in cs
];
%}
% 4 , 0.3 , forced direction , 8.5
%{
agents1=[
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
agents1=[
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
% 1 , 0.3 , 4.5
%{
agents1=[
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
%{
load('agents_2.5s_config2.mat')
for i = 1:length(agents)
    agents1(i).position = agents(i).position;
    agents1(i).velocity = agents(i).velocity;
end
    clear agents;
    agents = agents1;
    clear agents1;
    %}
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
%config9
%
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
dt = 0.1;
counter = 0;
%counter = 279;
axisLimits = [-12 12 -12 12]/1.5;
maxIterations = 1000;
Sides = [];
rws = [];
lws = [];
zws = [];

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
     else
         agents(i).obs = [];
     end
    end
    %
    %}
sides = [];
rws = [];
lws = [];
    for m = 1 :length(agents)
      if(agents(m).gflag ~= 1) 
  %  agents(m).path = [agents(m).path ; agents(m).position];
      if isempty(agents(m).obs)
      agents(m).side = 2;
     
      else
       px = agents(m).position(1);
       py = agents(m).position(2);
       vm = agents(m).vmax * 1.5;
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
           [x1,y1,x2,y2]=CC(agents(m).position, obstacle.position, (agents(m).radius + obstacle.radius)*2/1.6, agents(m).radius);
           [x1o,y1o,x2o,y2o] = VO(x1,y1,x2,y2,obstacle.velocity);
           x1o(1) = agents(m).position(1) + obstacle.velocity(1);
           y1o(1) = agents(m).position(2) + obstacle.velocity(2);
           x2o(1) = agents(m).position(1) + obstacle.velocity(1);
           y2o(1) = agents(m).position(2) + obstacle.velocity(2);
           [xint1,yint1] = getintersection(x1o,y1o,agents(m).sqpoly);
           [xint2,yint2] = getintersection(x2o,y2o,agents(m).sqpoly);
           agents(m).volegs = [agents(m).volegs ; x1o(1) , y1o(1) ,x1o(2),y1o(2), x2o(2) , y2o(2)];
           if p == 1
           agents(m).vospace = constructpoly(agents(m),agents(m).position + obstacle.velocity,xint1,yint1,xint2,yint2);
           agents(m).ospace  = [agents(m).ospace;agents(m).vospace];
           elseif p > 1
           ospace = constructpoly(agents(m),agents(m).position + obstacle.velocity,xint1,yint1,xint2,yint2);
           agents(m).ospace = [agents(m).ospace;ospace];
           agents(m).vospace = union(agents(m).vospace,ospace);
           end
           obstacle = [];
       end
 
%%%%%%%%%
agents(m).freespace = agents(m).sqpoly;
agents(m).freespace = subtract(agents(m).freespace,agents(m).vospace);

%%
agents(m).rshapes = [];
agents(m).lshapes = [];
for i = 1:length(agents(m).ospace)
     [rshape,lshape] = dividevshape_legs(agents(m),agents(m).volegs,i);
     agents(m).rshapes = [agents(m).rshapes ; rshape];
     agents(m).lshapes = [agents(m).lshapes ; lshape];
end
    
   end
    else
    agents(m).freespace = agents(m).sqpoly;
    agents(m).side = 2;
    end
    end
    
    
    
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
    %}
    for i = 1 : length(agents)
        if agents(i).gflag ~= 1
        if agents(i).side == 2
            agents(i).newControl = ((agents(i).goal - agents(i).position) / norm(agents(i).goal - agents(i).position)) * agents(i).vmax;
        else
        agents(i).newControl = getControls_freespace(agents,i,dt);
        end
        
   
        if counter > 190
        vel_an(agents,i,sides);
        end
       % agents(i).position = agents(i).position + agents(i).velocity * dt;
        goaldist = norm(agents(i).position - agents(i).goal);
        if goaldist < agents(i).radius/2
            agents(i).gflag = 1;
        end
        else
            agents(i).gflag = 1;
            agents(i).newControl = [0,0];
           % agents(i).position = agents(i).position;
        end
        
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    n=4;
    v=zeros(length(agents),n);
    w=zeros(length(agents),n);
    if counter < 110
        lb = 0;
        ub = 0;
    else
        lb = -2;
        ub = 2;
    end
    for i = 1:length(agents)
           if(agents(i).gflag~=1)
            agents(i).path = [agents(i).path; agents(i).position];
            goal_pos = futurePosition(agents(i), dt); 
            %The position reached following a holonomic model
           % v , w for each agent at n waypoints from current position to
           % future holonomic position
           agents(i).Vh = agents(i).newControl;
            [v(i,:),w(i,:),coeff]= vel_prof(agents(i),goal_pos,n,lb,ub);
            agents(i).coeff=coeff;
           end
        
    end
   
        vel =[];
   vel =[];
        
    for j=1:n
        %Updating the positions of all agents at each of the n waypoints
        %and plotting them
        
          for m=1:length(agents) 
              if(agents(m).gflag~=1)
              agents(m).path = [agents(m).path; agents(m).position];
              % To calculate distance from goal
              diff_vec = (agents(m).position - agents(m).goal);
              diff_sq = diff_vec.^2;
              goaldist = sqrt(sum(diff_sq));
              if goaldist > agents(m).radius
            [agents(m).position,agents(m).phi]=newPosition(agents(m),v(m,j),w(m,j),dt/n);
            agents(m).velocity=newVelocity(agents(m),v(m,j),agents(m).phi);
              else
                  agents(m).gflag = 1;
                  agents(m).velocity = [0,0];
              end
              else
                  agents(m).velocity = [0,0];
              end
          end
      plotSimulation(agents, counter, dt, axisLimits, false);
          %%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    counter = counter + 1;
          
    sumg = 0;
    for k = 1:length(agents)
        sumg = sumg + agents(k).gflag;
    end
    if sumg == length(agents)
            break;
    end
   
end


