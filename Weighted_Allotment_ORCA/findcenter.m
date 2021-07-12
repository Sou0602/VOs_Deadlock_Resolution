function [cx,cy] = findcenter(agent)

%phi = agent.phi;

phi = -0.3;
m = tan(phi);
%{
xc = agent.position(1);
yc = agent.position(2);
xg = agent.goal(1);
yg = agent.goal(2);
%}


xc = 14.3;
yc = 6;
xg = -1;
yg = -6;

syms  x y 
%eqns = [x*(xg-xc) + y*(yg-yc) + (xc^2 + yc^2 - xg^2 - yg^2)/2 == 0 ; x + m*y - xc - m*yc == 0];
eqn1 = sqrt((x-xg)^2 + (y-yg)^2) == sqrt((x-xc)^2 + (y-yc)^2);
eqn2 = x + m*y - xc - m*yc == 0;
eqns = [eqn1 ; eqn2];
S = solve(eqns , [x y]);
cx = double(S.x);
cy = double(S.y);
%{
cx = ((yc + xc/m - yg)^2 + xg^2)/(2* (yc/m - yg - xc + xg));
cy = yc - 1/m * (cx - xc);
%}
end