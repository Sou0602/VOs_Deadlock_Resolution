function sum = gettrajlength(agent)
% Trajlength - Approximation of trajectory length for comparison | sum of squares of distances between consecutive path points
%
% Syntax: sum = gettrajlength(agent)
%
path = agent.path;
length = 0;
sum = 0;
for i = 1:size(path,1) - 1
    px = agent.path(i,1);
    py = agent.path(i,2);
    
    px1 = agent.path(i+1,1);
    py1 = agent.path(i+1,2);
    
    length = sqrt((px1 - px) ^2 + (py1 - py)^2);
    sum = sum + length;
end
