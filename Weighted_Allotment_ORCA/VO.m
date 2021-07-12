function [x1o,y1o,x2o,y2o] = VO(x1,y1,x2,y2,obsvel)
% Vo - calculating the velocity obstacles from the Collision cone legs and
% the obstacle velocity
%
% Syntax: [x1o,y1o,x2o,y2o] = VO(x1,y1,x2,y2,obsvel)
%        

v1 = obsvel(1);
v2 = obsvel(2);

x1o = x1 + v1;
x2o = x2 + v1;
y1o = y1 + v2;
y2o = y2 + v2;
end