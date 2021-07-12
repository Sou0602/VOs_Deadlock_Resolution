
%% Clear workspace
%
clc;
clear all;
close all;
%}
%% Declare the agents
% Usage: addAgent(name, initialPosition, initialVelocity, goal)
%4agents - antipodal - (0.5, 0.8) , (0.3 , 1.6) , (0.3 , 2.4)
%{
agents = [
    addAgent('1', [-5 -5], [0 0], [5 5],1),
    addAgent('2', [5 -5],   [0 0], [-5 5],1),
    addAgent('3', [-5 5],  [0 0], [5 -5],1),
    addAgent('4', [5 5],  [0 0], [-5 -5],1),
    ];
%}

%3v2 - (0.3 , 3.2) , (0.3 , 1.6)
%{
agents = [
     addAgent('1', [-8 2.5], [0 0], [5 2.5],1),
     addAgent('2', [5 1.5],   [0 0], [-5 1.5],1),
     addAgent('3', [-8 0],  [0 0], [5 0],1),
     addAgent('4', [5 -1.5],  [0 0], [-5 -1.5],1),
     addAgent('5', [-8 -2.5],  [0 0], [5 -2.5],1), 
];
%}
%6agents - config1
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

%6agents - config2
%{
agents=[
     addAgent('1', [-7 -3], [0 0], [6 4],1),
     addAgent('2', [8 5],   [0 0], [-5 -4],1),
     addAgent('3', [-4 6],     [0 0], [1 -8],1),
     addAgent('4', [6 0],  [0 0], [-8 0],1),
     addAgent('5', [8 -5],  [0 0], [-7 5],1), 
     addAgent('6', [-1 -7],  [0 0], [1 6],1), 

];
%}
%6agents - config3 
%{
agents=[
    
     addAgent('1', [-6 6],     [0 0], [10 -5],1),
     addAgent('2', [6 -8],  [0 0], [-6 6],1),
     addAgent('3', [-8 0],  [0 0], [8 0],1),  
     addAgent('4', [8 -1],  [0 0], [-6 -7],1),
     addAgent('5', [-7 3],  [0 0], [6 3],1), 
     addAgent('6', [8 3],  [0 0], [-3 -8],1), 

];
%}
%8agents - config4
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
   %  addAgent('9', [8 5],  [0 0], [-2 -5],1),    
];
%}
%9agents - config5
%
agents=[
     addAgent('1', [-8 0], [0 0], [8 0],1),
     addAgent('2', [-6 4],   [0 0], [6 -8],1),
     addAgent('3', [-6 -3],     [0 0], [8 3],1),
     addAgent('4', [0 -8],  [0 0], [0 8],1),
     addAgent('5', [-3 -6],  [0 0], [8 7],1), 
     addAgent('6', [4 -7],  [0 0], [-4 8],1), 
     addAgent('7', [3 6],  [0 0], [3 -6],1), 
     addAgent('8', [5 -6],  [0 0], [5 7],1), 
     addAgent('9', [-3 6],  [0 0], [-3 -6],1), 
];
%}
%9agents - config6
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
%dconfig
%{
agents=[
     addAgent('1', [-6 -6], [0 0], [6 6],1),
     addAgent('2', [-6 -3],   [0 0], [6 9],1),
     addAgent('3', [-6 6],     [0 0], [6 -6],1),
     addAgent('4', [-6 3],  [0 0], [6 -9],1),
     addAgent('5', [-3 6],  [0 0], [-3 -6],1), 
     addAgent('6', [-1 -6],  [0 0], [-1 6],1), 
     addAgent('7', [5 1],  [0 0], [-5 1],1), 
     addAgent('8', [5 -1],  [0 0], [-5 -1],1), 
     addAgent('9', [1 7],  [0 0], [1 -6],1), 
];
%}
%Scaled config3(cs-1)
%{
agents=[
    
     addAgent('1', [-6 6]*10,     [0 0], [10 -5]*10,1),
     addAgent('2', [6 -8]*10,  [0 0], [-6 6]*10,1),
     addAgent('3', [-8 0]*10,  [0 0], [8 0]*10,1),  
     addAgent('4', [8 -1]*10,  [0 0], [-6 -7]*10,1),
     addAgent('5', [-7 3]*10,  [0 0], [6 3]*10,1), 
     addAgent('6', [8 3]*10,  [0 0], [-3 -8]*10,1), 
   
];
%}
%Scaled - cs-2
%{
agents=[
     addAgent('1', [-7 -3]*10, [0 0], [6 4]*10,1),
     addAgent('2', [8 5]*10,   [0 0], [-5 -4]*10,1),
     addAgent('3', [-4 6]*10,     [0 0], [1 -8]*10,1),
     addAgent('4', [6 0]*10,  [0 0], [-8 0]*10,1),
     addAgent('5', [8 -5]*10,  [0 0], [-7 5]*10,1), 
     addAgent('6', [-1 -7]*10,  [0 0], [1 6]*10,1), 

];
%}
%Scaled - cs - 3
%{
agents=[
     addAgent('1', [-6 -2]*10, [0 0], [4 2]*10,1),
     addAgent('2', [-5 3]*10,   [0 0], [4 -3]*10,1),
     addAgent('3', [-4 -4]*10,     [0 0], [2 4]*10,1),
     addAgent('4', [4 0]*10,  [0 0], [-8 0]*10,1),
     addAgent('5', [4 -2]*10,  [0 0], [-7 2]*10,1), 
     addAgent('6', [2 -4]*10,  [0 0], [-1 5]*10,1), 

];
%}
%{
agent_p = [-15,7];
obs_p = [-4,4;-2,2;0,0;2,-2;-4,-4;-2,-2;6,-6;8,-8];
obs_v = [-1,0.4;-1,0.4;-1,0.4;-1,0.4;-1,0.4;-1,0.4;-1,0.4;-1,0.4];
goal_p = [7,-7];

agents = [
    addAgent('1', agent_p, [0 0], goal_p),
    addAgent('2', obs_p(1,:),   [0 0], obs_p(1,:)+15*obs_v(1,:)),
    addAgent('3',  obs_p(2,:),  [0 0], obs_p(2,:)+15*obs_v(2,:)),
    addAgent('4',  obs_p(3,:),  [0 0], obs_p(3,:)+15*obs_v(3,:))
    addAgent('5',  obs_p(4,:), [0 0], obs_p(4,:)+15*obs_v(4,:)),
    addAgent('6',  obs_p(5,:), [0 0], obs_p(5,:)+15*obs_v(5,:)),
    addAgent('7',  obs_p(6,:), [0 0],  obs_p(6,:)+15*obs_v(6,:)),
];
%}
%{
agents=[
     addAgent('1', [-6 -2]*10, [0 0], [4 2]*10,1),
     addAgent('2', [-5 3]*10,   [0 0], [4 -3]*10,1),
     addAgent('3', [-4 -4]*10,     [0 0], [2 4]*10,1),
     addAgent('4', [2 0]*10,  [0 0], [-8 0]*10,1),
     addAgent('5', [2 -2]*10,  [0 0], [-7 2]*10,1), 
     addAgent('6', [0 -4]*10,  [0 0], [-1 5]*10,1), 
     addAgent('7', [-2 -4]*10,  [0 0], [-4 5]*10,1),
     addAgent('8', [1 -3.5]*10,  [0 0], [0.5 3]*10,1),
     addAgent('9', [0 4]*10,     [0 0], [-6 -4]*10,1),
];
%}
%{
agents=[
     addAgent('1', [-6 -2]*10, [0 0], [4 2]*10,1),
     addAgent('2', [-4 1]*10,   [0 0], [3 -3]*10,1),
     addAgent('3', [-4 -4]*10,     [0 0], [2 4]*10,1),
     addAgent('4', [2 0]*10,  [0 0], [-8 0]*10,1),
     addAgent('5', [2 -2]*10,  [0 0], [-6 0]*10,1), 
     addAgent('6', [0 -4]*10,  [0 0], [-1 5]*10,1), 
     addAgent('7', [-2 -4]*10,  [0 0], [-4 5]*10,1),
     addAgent('8', [1 -3.5]*10,  [0 0], [-2 2.5]*10,1),
     addAgent('9', [1.5 1.5]*10,     [0 0], [-6 -4]*10,1),
];
%}
%dconfigg-1.2
%{
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
%dconfig_1.3
%{
agents=[
     addAgent('1', [-1 -5], [0 0], [7 0],1),
     addAgent('2', [10 3],   [0 0], [-5 -3],1),
     addAgent('3', [11 -1],  [0 0], [-2 -2.5],1),
     addAgent('4', [3 4],  [0 0], [8 -8],1),
     addAgent('5', [3 -6],  [0 0], [3 6],1), 
     addAgent('6', [4 -5],  [0 0], [1 4],1), 
     addAgent('7', [9 0],  [0 0], [-4 2],1),
     addAgent('8', [-2 -1],  [0 0], [9 -4],1),  
];
%}
%dconfig10
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
%_1.6
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
%-1.9
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
%}
% Rotated

%{
agents=[
     addAgent('1', [-8 0], [0 0], [8 0],1),
     addAgent('2', [-6 4],   [0 0], [6 -8],1),
     addAgent('3', [-6 -3],     [0 0], [8 3],1),
     addAgent('4', [1 -6],  [0 0], [1 8],1),
     addAgent('5', [-3 -6],  [0 0], [8 7],1), 
     addAgent('6', [4 -7],  [0 0], [-4 8],1), 
     addAgent('7', [3 6],  [0 0], [3 -6],1), 
     addAgent('8', [5 -6],  [0 0], [5 7],1), 
     addAgent('9', [-1 6],  [0 0], [-1 -6],1), 
];
%}
%{
rot = [0 1 ; -1 0];
for i = 1:length(agents)
    agents(i).initialpos = agents(i).position*rot;
    agents(i).position = agents(i).position*rot;
    agents(i).goal = agents(i).goal*rot;
    agents(i).phi=atan2((agents(i).goal(2)-agents(i).position(2)),(agents(i).goal(1)-agents(i).position(1)));
end
%}


axisLimits = [-12 12 -12 12]/2*20; % [xmin xmax ymin ymax] axis limits of the plot
dt = 0.1;
Velnorm = [];
%% Simulation loop
% Runs till the distance to goal of all the agents is less than 0.32m
% Or for max iterations
maxIterations = 500;
counter = 0;
T = zeros(maxIterations,1);
Velocity= [];
omega = [];
Trackerr = [];
while counter < maxIterations
    
    
    maxDistFromGoal = 0;
    % Get the new velocity command for every agent but do not update it now
   
    for i = 1:length(agents)
        agents(i).vmax = 1.3;
        tic
        % Get agents in the sensor range
        % gflag - flag is equal to one when agent reaches goal
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
        % Get the new control for the agent
        
        %{
        for k = 1 : length(obstacles)
            dist = norm(agents(i).position - obstacles(k).position);
        if dist < 3*agents(i).radius
        agents(i).cflag = 1;
        agents(i).cstore = agents(i).newControl;
        agents(i).newControl = [0.0001 ,0.0001];
        end
        end
        %}
        else
        % If the agent reaches goal , new control is zero.
         agents(i).newControl = [0,0];
         agents(i).velocity = [0,0];
        end
        agents(i).t1 = toc;
    end
    velocities = getControls_joint(agents, dt);
    
    for i = 1:length(agents)
        agents(i).newControl = [velocities(i),velocities(length(agents)+i)];
    end
    
    % Update the positions of all the agents using the newly obtained controls
    % This is equivalent to running the same algorithm simultaneously on all agents
    n=4;
    v=zeros(length(agents),n);
    w=zeros(length(agents),n);

    trackerr = zeros(1,length(agents));
    for i = 1:length(agents)
        tic
           if(agents(i).gflag~=1)
            agents(i).path = [agents(i).path; agents(i).position];
            goal_pos = futurePosition(agents(i), dt); %The position reached following a holonomic model
           % v , w for each agent at n waypoints from current position to
           % future holonomic position
           agents(i).Vh = agents(i).newControl;
            [v(i,:),w(i,:),coeff]= vel_prof(agents(i),goal_pos,n);
            agents(i).trackerr = gettrackerr(agents(i).Vh,dt,v(i,:),w(i,:),agents(i).phi,n);
            agents(i).omegadata = [agents(i).omegadata ; w(i,:)];
            agents(i).vdata = [agents(i).vdata ; v(i,:)];
            agents(i).coeff=coeff;
            trackerr(i) = agents(i).trackerr;
           end
        agents(i).t2 = toc ; 
        agents(i).t3 = [];
        
    end
    Trackerr = [Trackerr ; trackerr];
        vel =[];
      
    for j=1:n
        %Updating the positions of all agents at each of the n waypoints
        %and plotting them
          vel_norm = [];
          for m=1:length(agents) 
              
              tic
              
              if(agents(m).gflag~=1)
              agents(m).path = [agents(m).path; agents(m).position];
              % To calculate distance from goal
              diff_vec = (agents(m).position - agents(m).goal);
              diff_sq = diff_vec.^2;
              goaldist = sqrt(sum(diff_sq));
              if goaldist > agents(m).radius*0.85
            [agents(m).position,agents(m).phi]=newPosition(agents(m),v(m,j),w(m,j),dt/n);
            agents(m).velocity=newVelocity(agents(m),v(m,j),agents(m).phi);
            agents(m).VelData = [agents(m).VelData ; agents(m).velocity];
              else
                  agents(m).gflag = 1;
                  agents(m).velocity = [0,0];
              end
              else
                  agents(m).velocity = [0,0];
            %goaldist = sqrt(sum((agents(i).position - agents(i).goal).^2));
           % vel = [vel;agents(m).velocity, m ,goaldist,agents(m).gflag];
              end
              vel = [vel;agents(m).velocity, m ,goaldist,agents(m).gflag];
              
              agents(m).t3 = [agents(m).t3,toc];
              
          end
          Velocity = [Velocity ; vel ];
          
    % Plot the current simulation step
    % Usage: plotSimulation(agents, counter, dt, axisLimits, true) -> Save the outputs to disk
    %        plotSimulation(agents, counter, dt, axisLimits, false) -> Don't save the outputs to disk
          if counter > 39
           %   vel_an(agents,8);
          end
              
          plotSimulation(agents, counter, dt, axisLimits, true); 
    end
  
    counter = counter + 1;
    sum1 = 0;
    % Stop running if the goal is reached
    vel_norm = [];
    for k = 1:length(agents)
        agents(k).timedata = [agents(k).timedata;sum(agents(k).t1 + agents(k).t2 + sum(agents(k).t3))];
    if agents(k).gflag == 1
        sum1 = sum1 +1;
    end
    
    if agents(k).cflag == 1 
       agents(k).cflag = 0;
       agents(k).newControl = agents(k).cstore;
    end
   vel_norm = [vel_norm , norm([agents(k).velocity])];
    end
    Velnorm =  [Velnorm;vel_norm]; 
    if sum1 == length(agents)
        
        break
        
    end
    %}
  
end