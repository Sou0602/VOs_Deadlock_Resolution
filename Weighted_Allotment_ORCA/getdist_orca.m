function [u , nM] = getdist_orca(agents,i,j)
%getConstraints - Description
%
% Syntax: [c ceq] = getConstraints(agent, obstacles)
%
    u = [];
    nM = [];
    
    % Time horizon
    tau = 0.8*2 ;    
 
        
        % Refer the paper for explanation on these terms
        vRel = agents(i).velocity - agents(j).velocity;
        vAb = agents(i).velocity + agents(j).velocity;
        pAb = ( -agents(i).position + agents(j).position)/tau;
        
        % Finding pAb perpendicular
        r = 4*agents(i).radius/ tau  ;
        l = abs(sqrt(sum(pAb.^2) - r^2));

        pAblen = sqrt(sum(pAb.^2));
        m = [
            l -r;
            r  l
        ];

        qL = (pAb * m') * ( 1/ sum(pAb.^2));
        qR = (pAb * m ) * ( 1/ sum(pAb.^2));
        pAbL = [qL(2) -qL(1)];
        pAbR = [qR(2) -qR(1)];
     
        %collision cone check
        if ((pAblen)^2-(dot(pAb,vRel)^2)/sum(vRel.^2))<=r^2  

        
            d1=abs((qL(2)*vRel(1) - qL(1)*vRel(2))/sqrt(qL(1)^2+qL(2)^2));%distance to left side of the cone
            d2=abs((qR(2)*vRel(1) - qR(1)*vRel(2))/sqrt(qR(1)^2+qR(2)^2));%distance to the right side of the cone
            
          
            nM=[pAbL/sqrt(sum(pAbL.^2));pAbR/sqrt(sum(pAbR.^2))];
            u = [d1*nM(1,:) ; d2*nM(2,:)];
        end

    

    
end