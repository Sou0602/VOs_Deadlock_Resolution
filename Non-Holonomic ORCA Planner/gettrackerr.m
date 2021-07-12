function error = gettrackerr(Vh,dt,v,w,phi,n)
% trackerror - Error between holonomic position and non-holonomic position after mapping
%
% Syntax: error = gettrackerr(Vh,dt,v,w,phi,n)
%
delt = dt/n;
holpos = Vh * dt;
pos = [0 0];
for i = 1:length(v)
    phi = phi + w(i) * delt;
    pos = pos + v(i) * [cos(phi) sin(phi)] * delt;
end

error = norm(pos - holpos);
end