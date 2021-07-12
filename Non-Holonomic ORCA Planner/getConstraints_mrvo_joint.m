function [c ceq] = getConstraints_mrvo_joint(agents, control, dt)
 c = [];
    ceq = [];
    
    % Time horizon
    tau = 0.8;    
    for i = 1:length(agents)
        for j = 1 : length(agents(i).obs)
        oname = str2double(agents(i).obs(j));
        vRel = agents(i).velocity - agents(oname).velocity;
        vAb = agents(i).velocity + agents(oname).velocity;
        pAb = ( -agents(i).position + agents(oname).position)/tau;
        
        % Finding pAb perpendicular
        r = 4.7* agents(i).radius/tau;
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

        
            d1=abs((qL(2)*vRel(1) - qL(1)*vRel(2))/sqrt(qL(1)^2+qL(2)^2));
            d2=abs((qR(2)*vRel(1) - qR(1)*vRel(2))/sqrt(qR(1)^2+qR(2)^2));
            d3=Inf;
            w=vRel-pAb;
        %Selecting the direction of minimum distance to the boundary of the
        %collision cone.
            if(pAblen>r)
                if dot(w,pAb)<0 && norm(w)<r &&dot(w,pAb)^2> r^2 * (sum(w.^2))    
                    d3=abs(r-sqrt(sum(w.^2)));
                end
                
                dM=[d1,d2,d3];
                nM=[pAbL/sqrt(sum(pAbL.^2));pAbR/sqrt(sum(pAbR.^2));w/norm(w)];%pAb/pAblen];
                [d,j]=min([d1,d2,d3]);
                u=d*nM(j,:);
                nor=nM(j,:);
                

            else
                w=vRel-pAb;
                d = abs(r - sqrt(sum(w.^2)));
 
                u=d*w/norm(w);
                nor=w/norm(w);

            end
         

            c(end+1)=-1*((control(i)-(agents(i).velocity(1)+.5*u(1)))*nor(1)+ (control(length(agents)+i)-(agents(i).velocity(2)+.5*u(2)))*nor(2));
 
        end
                       
        end

    end
end