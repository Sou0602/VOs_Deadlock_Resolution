function [v,w,coeffi]=vel_prof(agent,goal_pos,n,lb,ub)
%vel_prof - Gives the velocity and omega calculated at each of the n points
%           from current position to the holonomic goal pos

    xf=goal_pos(1);
    yf=goal_pos(2);
    thetaf=atan2(agent.newControl(2),agent.newControl(1));
    
  
    xi=agent.position(1);
    yi=agent.position(2);
    thetai=atan2(agent.velocity(2),agent.velocity(1));
   
    if isnan(thetai)
       thetai=atan2((agent.goal(2)-agent.position(2)),(agent.goal(1)-agent.position(1))) ;
    end
    
    if thetaf-thetai<-pi 
        del=pi-thetai;
        thetai=-pi-del;
    end
    if thetaf-thetai>pi
        del=pi+thetai;
        thetai=pi+del;
    end
   
    xfs=[xi,xf];
    yfs=[yi,yf];
    thetafs=[thetai,thetaf];
    %% Curve-generate - generates the curvature coefficients
    [X,Y,coeffi]=curve_generate(xfs,yfs,thetafs,n,lb,ub,agent.outflag);
    
    vel=sqrt(sum(agent.newControl.^2));
    
    s_tot = sqrt((X(1)-X(end))^2+(Y(1)-Y(end))^2);
    n=length(X);
    s_cur= linspace(0.01,s_tot,n);
    cur=coeffi(4)*(s_cur.^3) + coeffi(3)*(s_cur.^2) + coeffi(2)*s_cur + coeffi(1);
    v=vel*ones(1,length(X));
    w=vel*cur;
    
    %% Use this condition to limit the angular velocities.
    %{
    for i = 1:length(w)
        if w(i)>0 && w(i) > 1.1
           w(i) = 1.1;
        elseif w(i)<0 && w(i) < -1.1
            w(i) = -1.1;
        end
    end
   %}
    
end