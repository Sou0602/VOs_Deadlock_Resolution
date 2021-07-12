function [c, ceq] = getConstraints_orca_l(agents,i,control, dt)
%getConstraints_orca_l - Derives Orca constraints for the obstacles that
%are alloted to be on the left side of the agent
%
% Syntax: [c ceq] = getConstraints_orca_l(agents, i,control,dt)
%
    c = [];
    ceq = [];
    cflag = 0;
    % Time horizon
    tau = 0.8*2 ;    
    for k = 1:length(agents(i).obs)

       oname = str2double(agents(i).obs(k));
        % Refer the paper for explanation on these terms
        vRel = agents(i).velocity - agents(oname).velocity;
        vAb = agents(i).velocity + agents(oname).velocity;
        pAb = ( -agents(i).position + agents(oname).position)/tau;
        
        % Finding pAb perpendicular
        r = (4.0)*agents(i).radius/ tau  ;
        l = abs(sqrt(sum(pAb.^2) - r^2));

        pAblen = sqrt(sum(pAb.^2));
        m = [
            l -r;
            r  l
        ];

        p1 = (pAb * m') * ( 1/ sum(pAb.^2));
        p2 = (pAb * m ) * ( 1/ sum(pAb.^2));
        n1 = [p1(2) -p1(1)];
        n2 = [p2(2) -p2(1)];
        
    tp1 = atan2(p1(2),p1(1));
    tp2 = atan2(p2(2),p2(1));
    tn1 = atan2(n1(2),n1(1));
    tn2 = atan2(n2(2),n2(1));
    
    thetas = [tp1,tp2,tn1,tn2];
    
    for m = 1:length(thetas)
    if thetas(m) < 0 && thetas(m) >= -pi
        thetas(m) = thetas(m) + 2*pi;
    end
    end
    tp1 = thetas(1);
    tp2 = thetas(2);
    tn1 = thetas(3);
    tn2 = thetas(4);
    
    t1diff = tn1 - tp1;
    t2diff = tn2 - tp2;
    tpdiff = tp2 - tp1;
    
    if tp1 > 0 && tp1 < pi/2
        if tpdiff > 0 && tp2 < pi + tp1
            if t1diff >= pi/2 - 0.1 && t1diff <= pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff >= -pi/2 - 0.1 && t2diff <= -pi/2 + 0.1
                n2 = -n2;
            end
        else
            if t1diff >= 3*pi/2 - 0.1 && t1diff <= 3*pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff == -3*pi/2 - 0.1 && t2diff <= -3*pi/2 + 0.1
                n2 = -n2;
            end
        end
    elseif tp1 > pi/2 && tp1 < pi
         if tpdiff > 0 && tp2 < pi + tp1
            if t1diff >= pi/2 - 0.1 && t1diff <= pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff >= -pi/2 - 0.1 && t2diff <= -pi/2 + 0.1
                n2 = -n2;
            end
        else
            if t1diff >= -pi/2 - 0.1 && t1diff <= -pi/2 + 0.1    
            n1 = -n1;
            end
            if t2diff >= -pi/2- 0.1 && t2diff <= -pi/2 + 0.1
                n2 = -n2;
            end
        end
    elseif tp1 > pi && tp1 < 3*pi/2
         if tpdiff < 0 && tp2 > tp1 - pi
            if t1diff >= -pi/2 - 0.1 && t1diff <= -pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff >= pi/2 - 0.1 && t2diff <= pi/2 - 0.1
                n2 = -n2;
            end
        else
            if t1diff >= pi/2 - 0.1 && t1diff <= pi/2 - 0.1
            n1 = -n1;
            end
            if t2diff >= -pi/2 - 0.1 && t2diff <= -pi/2 + 0.1
                n2 = -n2;
            end
        end
    elseif tp1 > 3*pi/2 && tp1 < 2*pi
        if tpdiff < 0 && tp2 > tp1 - pi
            if t1diff >= -pi/2 - 0.1 && t1diff <= -pi/2 + 0.1
            n1 = -n1;
            end
            if t2diff >= pi/2 - 0.1 && t2diff <= pi/2 - 0.1
                n2 = -n2;
            end
        else
            if t1diff >= -3*pi/2 - 0.1 && t1diff <= -3*pi/2 + 0.1   
            n1 = -n1;
            end
            if t2diff >= 3*pi/2 - 0.1 && t2diff <= 3*pi/2 + 0.1   
                n2 = -n2;
            end
        end
    end
     
        %collision cone check
        if ((pAblen)^2-(dot(pAb,vRel)^2)/sum(vRel.^2))<=r^2  && dot(pAb,vRel) >= 0

        
            d1=abs((p1(2)*vRel(1) - p1(1)*vRel(2))/sqrt(p1(1)^2+p1(2)^2));%distance to left side of the cone
            d2=abs((p2(2)*vRel(1) - p2(1)*vRel(2))/sqrt(p2(1)^2+p2(2)^2));%distance to the right side of the cone
            nM=[n1/sqrt(sum(n1.^2));n2/sqrt(sum(n2.^2))];
                        d3=Inf;
            w=vRel-pAb;
        %Selecting the direction of minimum distance to the boundary of the
        %collision cone.
            if(pAblen>r)
                if dot(w,pAb)<0 && norm(w)<r &&dot(w,pAb)^2> r^2 * (sum(w.^2))    
                    d3=abs(r-sqrt(sum(w.^2)));
                end
                
                dM=[d1,d2,d3];
                nM=[n1/sqrt(sum(n1.^2));n2/sqrt(sum(n2.^2));w/norm(w)];%pAb/pAblen];
                [d,j]=min([d1,d2,d3]);
                u=d*nM(j,:);
                nor=nM(j,:);
                

            else
                w=vRel-pAb;
                d = abs(r - sqrt(sum(w.^2)));
 
                u=d*w/norm(w);
                nor=w/norm(w);

            end
            
            for p = 1:length(agents(i).rws)
            if agents(i).rws(p) ~= 0
            if oname == agents(i).rws(p)
            u = d1*nM(1,:);
            nor = nM(1,:); 
            end
            end
            end
           
           %{ 
            for p = 1:length(agents(i).zws)
            if agents(i).zws(p) ~= 0
            if oname == agents(i).zws(p)
            cflag = 0;
            end
            end
            end
            %}
            %
            if agents(i).fflag == 1
            u = d1*nM(1,:);
            nor = nM(1,:); 
            end
            if cflag ~= 1
              c(end+1)=-1*((control(1)-(agents(i).velocity(1)+.5*u(1)))*nor(1)+ (control(2)-(agents(i).velocity(2)+.5*u(2)))*nor(2));
            end
            
           % c(end+1)=-1*((control(1)-(agents(i).velocity(1)+.5*u(1)))*nor(1)+ (control(2)-(agents(i).velocity(2)+.5*u(2)))*nor(2));
 
        end
        cflag =0;
    end

  
end