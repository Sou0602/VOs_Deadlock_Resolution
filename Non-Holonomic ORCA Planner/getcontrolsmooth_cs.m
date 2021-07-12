function [controlsmooth,table] = getcontrolsmooth_cs(agent)
%
%Control Smoothness for Cubic Spiral Trajectory - comparison purpose
%
% Syntax : [controlsmooth,table] = getcontrolsmooth_cs(agent)
veldata = agent.VelData;

table = zeros(floor(size(veldata,1)/4)-1,1);
for k = 1:floor(size(veldata,1)/4)- 1
    
    if mod(k,4) == 1
    Velk = veldata(k,:);
    Velk1 = veldata(k+4,:);
    end
    
    table(k) = norm(Velk1 - Velk);

end

controlsmooth = sum(table)/((size(table,1))*agent.vmax);

end