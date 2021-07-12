function [X_path,Y_path,coeff_table]=curve_generate(xfs,yfs,thetafs,n,lb,ub,of)
%%xfs:array of the x-coordinates of the intermediate points between which
%%we intend to generate curves. The rows of this array represents different
%%agents.
%%Similarly "yfs" and "thetafs" are the array of y-coordinates and theta
%%coordinates of intermediate points for different agents.

%%%%


sft = [];

coeff_table = zeros(size(xfs,1),5*(size(xfs,2)-1));





X_path=zeros(size(xfs,1),(size(xfs,2)-1)*n);
Y_path=zeros(size(yfs,1),(size(xfs,2)-1)*n);
%cur=zeros(,(size(xfs,2)-1)*n);
%thet=zeros(2,(size(xfs,2)-1)*n);
%%%
for l=1:size(xfs,1)
    params = add_params(xfs(l,2),yfs(l,2),thetafs(l,2),xfs(l,1),yfs(l,1),thetafs(l,1));
    
    for j = 1:size(xfs,2)-1
        if j == 1
            xi=xfs(l,j);
            yi=yfs(l,j);
            thetai=thetafs(l,j);
        else
            xi=x_fren(params,res,n);
            yi=y_fren(params,res,n);
            thetai=theta(params,res);
        end
        
        %params = add_params(xfs(l,j+1),yfs(l,j+1),thetafs(l,j+1),xi,yi,thetai);
        params.xf=xfs(l,j+1);
        params.yf=yfs(l,j+1);
        params.thetaf=thetafs(l,j+1);
        params.xi=xi;
        params.yi=yi;
        params.thetai=thetai;
        
        res = optimize_spiral(params,lb,ub,of);
        
        p_f = res;
        sft = cat(1,sft,p_f(end));
        
        params.kf=p_f(4);%% impose curvature continuity
        
        s = linspace(.01,p_f(5),n);
        
       
        
        a=a3(p_f);
        b=a2(p_f);
        c=a1(p_f);
        d=a4(p_f);
        a_p=[d,c,b,a];
        k=zeros(1,n);
        X=zeros(1,n);
        Y=zeros(1,n);
        th=zeros(1,n);
        for i =1:n
            
            x = linspace(0,s(i),n+1); % N+1 points make N subintervals
            xr=x(2:length(x));
            y=zeros(length(xr),1);
            z=zeros(length(xr),1);
            for h =1:length(xr)
                y(h)=cos(theta_in(params,a_p,xr(h)));
                z(h)=sin(theta_in(params,a_p,xr(h)));
            end
            y_right = y(2:length(y)); % right endpoints
            y_left = y(1:length(y)-1);
            z_right = z(2:length(z)); % right endpoints
            z_left = z(1:length(z)-1); % left endpoints
            dx = (s(i) - 0)/n;
            
            X(i) = (dx/2) * sum(y_right + y_left)+ (dx/2)* cos(theta_in(params,a_p,(x(1)+x(2))/2))+params.xi;
            Y(i) = (dx/2) * sum(z_right + z_left)+(dx/2)* sin(theta_in(params,a_p,(x(1)+x(2))/2))+params.yi;
            k(i) = be_in(a_p,s(i));
            th(i)= theta_in(params,a_p,s(i));
        end
        X_path(l,(j-1)*n+1:j*n)=X;
        Y_path(l,(j-1)*n+1:j*n)=Y;
        %cur(l,(j-1)*n+1:j*n)=k;
        %thet(l,(j-1)*n+1:j*n)=th;
        coeff_table(l,(j-1)*5+1:(j-1)*5+4)=a_p;
        coeff_table(l,(j)*5)=p_f(5);
    end
    

end