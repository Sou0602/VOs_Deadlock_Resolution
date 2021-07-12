%x=[0 4 7 5 1];    %Polygon x-coordinates
%y=[0 -2 0 10 8]; %Polygon y-coordinates
n = 4;
%P = polyshape(x,y);
P = agents(1).freespace;
x = P.Vertices(:,1);
y = P.Vertices(:,2);

A = P.area/n;
xmin = min(x); xmax = max(x);
ymin = min(y); ymax = max(y);
b = zeros(1,n-1);
Q = cell(1,n);
[xc,yc] = P.centroid;
r = sqrt(max((x-xc).^2+(y-yc).^2))*1.1;
Qk = polyshape(); % empty
x0 = 2*pi/n;
for k=1:n-1
    x0 = fzero(@(tt) areafun(P, xc, yc, tt, r)-k*A, x0);
    b(k) = x0;
    Qp = Qk;
    [s, Qk] = areafun(P, xc, yc, x0, r);
    Q{k} = subtract(Qk, Qp);
end
Q{n} = subtract(P, Qk);
close all;
figure
hold on
for k=1:n
    Q{k}.area;
    plot(Q{k});
end
axis equal
function [s, Q] = areafun(P, xc, yc, tt, r)
ntt = max(ceil(abs(tt)*128),2);
phi = linspace(0,tt,ntt);
Q = polyshape([xc xc+r*cos(phi)],[yc yc+r*sin(phi)]);
Q = intersect(P,Q);
s = sign(tt)*Q.area;
end