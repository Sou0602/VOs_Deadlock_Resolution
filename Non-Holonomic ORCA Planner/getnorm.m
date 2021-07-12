function [normdis,normpoints] = getnorm(agent)
% normdis - Normal distance from current position to the line joining start to goal position
%
% Syntax: [normdis,normpoints] = getnorm(agent)
%
path = agent.path;
normdis = zeros(size(path,1),1);
normpoints = zeros(size(path,1),2);

    ix = agent.initialpos(1);
    iy = agent.initialpos(2);
    
    a = path(end,1) - path(1,1);
    b = path(end,2) - path(1,2);
    c = sqrt(a^2 + b^2);
    a = a/c;
    b = b/c;


for i = 1:size(path,1)
    px = agent.path(i,1);
    py = agent.path(i,2);
    

    
    ny = (a*b*(px - ix) + b^2 * py + a^2 * iy )/ (a^2 + b^2);
    nx = px - (b/a) * (ny - py);
    normpoints(i,:) = [nx,ny];
    
    normdis(i) = sqrt((nx - px)^2 + (ny - py)^2);
end
plot(normpoints(:,1),normpoints(:,2));
hold on
%{
Xg = [agent.initialpos(1) ; agent.goal(1)]; 
Yg = [agent.initialpos(2) ; agent.goal(2)]; 
plot(Xg,Yg,'b--','LineWidth',0.1);
%}
plot(path(:,1),path(:,2));
hold off
end