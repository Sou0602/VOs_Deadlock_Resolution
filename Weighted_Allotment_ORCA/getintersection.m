function [xint,yint] = getintersection(x,y,sq_poly)
%getintersection - Finds the intersecting points of the VO legs with the
%boundary of the freespace regions for each leg. Can be generalised to find
%the intersection of a line in the space with a polyshape.
%
% Syntax: [xint,yint] = getintersection(x,y,sq_poly)
%
sqx = sq_poly.Vertices(:,1);
sqy = sq_poly.Vertices(:,2);

xmax = max(sqx);
xmin = min(sqx);
ymax = max(sqy);
ymin = min(sqy);

m = (y(2) - y(1)) / (x(2) - x(1));

if ~isreal(m)
    disp('m complex')
end
phi = atan2(m,1);
if x(2) - x(1) < 0
    phi = phi + pi;
end
if phi > pi && phi < 2*pi
    phi = phi - 2*pi;
end

if x(1) <= xmax && x(1) >= xmin && y(1) <= ymax && y(1) >= ymin
  if phi > 0 && phi <= pi 
    xint = x(1) + (ymax - y(1))/m;
   if xint >= xmin && xint <= xmax
    xint = xint;
    yint = ymax;
   elseif xint <= xmin
    xint = xmin;
    yint = y(1) + m*(xmin - x(1));
   elseif xint >= xmax
    xint = xmax;
    yint = y(1) + m*(xmax - x(1));
   end
elseif phi <= 0 && phi > -pi
    xint = x(1) + (ymin - y(1))/m;
   if xint >= xmin && xint <= xmax
    xint = xint;
    yint = ymin;
   elseif xint <= xmin
    xint = xmin;
    yint = y(1) + m*(xmin - x(1));
   elseif xint >= xmax
    xint = xmax;
    yint = y(1) + m*(xmax - x(1));
   end
  end


   elseif y(1) > ymax 
    yint1 = ymax;
    xint1 = x(1) + (ymax - y(1))/m;
    if xint1 < xmax && xint1 > xmin
        %other three directions to get out
        xint = xmin;
        yint = y(1) + m*(xmin - x(1));
        if yint < ymin
            yint = ymin;
            xint = x(1) + (ymin - y(1))/m;
        elseif y(1) +m*(xmin - x(1))  > ymax
            yint = ymin;
            xint = x(1) + (ymin - y(1))/m;
            if xint > xmax
                xint = xmax;
                yint = y(1) + m*(xmax - x(1));
            end
        end
        
    elseif xint1 > xmax
        xint1 = xmax;
        yint1 = y(1) + m*(xmax - x(1));
        if yint1 > ymin && yint1 < ymax
            yint = ymin;
            xint = x(1) + (ymin - y(1))/m;
            if xint < xmin
                xint = xmin;
                yint = y(1) + m*(xmin - x(1));
            end
        end
        
    elseif xint1 < xmin 
        xint1 = xmin;
        yint1 = y(1) + m*(xmin - x(1));
        if yint1 < ymax && yint1 > ymin
            yint = ymax;
            xint = x(1) + (ymax - y(1))/m;
            if xint > xmax
                xint = xmax;
                yint = y(1) + m*(xmax - x(1));
            end
        end
    end
    
elseif y(1) < ymin
    yint1 = ymin;
    xint1 = x(1) + (ymin - y(1))/m;
     if xint1 < xmax && xint1 > xmin
         xint = xmax;
         yint = y(1) + m*(xmax - x(1));
         if yint > ymax
             yint = ymax;
             xint = x(1) + (ymax - y(1))/m;
         elseif y(1)+ m*(xmin - x(1)) < ymin
             yint = ymax;
             xint = x(1) + (ymax - y(1))/m;
             if xint < xmin
                 xint = xmin;
                 yint = y(1) + m*(xmin - x(1));
             end
         end
         
     elseif xint1 < xmin
         xint1 = xmin;
         yint1 = y(1) + m*(xmin - x(1));
         if yint1 < ymax && yint1 > ymin
             yint = ymax;
             xint = x(1) + (ymax - y(1))/m;
             if xint > xmax
                 xint = xmax;
                 yint = y(1) + m*(xmax - x(1));
             end
         end
             
     elseif xint1 > xmax
         xint1 = xmax;
         yint1 = y(1) + m*(xmax - x(1));
         if yint1 < ymax && yint1 > ymin
             yint = ymax;
             xint = x(1) + (ymax - y(1))/m;
             if xint < xmin
                 xint = xmin;
                 yint = y(1) + m*(xmin - x(1));
             end
         end
         
     end
     
elseif y(1) < ymax && y(1) > ymin 
    if x(1) < xmin
        xint1 = xmin;
        yint1 = y(1) + m*(xmin - x(1));
        if yint1 < ymax && yint1 > ymin
            yint = ymax;
            xint = x(1) + (ymax - y(1))/m;
            if xint > xmax
                xint = xmax;
                yint = y(1) + m*(xmax - x(1));
            elseif xint < xmax
                xint = xmax;
                yint = y(1) + m*(xmax - x(1));
                if yint < ymin
                    yint = ymin;
                    xint = x(1) + (ymin - y(1))/m;
                end
            end
        end
        
    elseif x(1) > xmax
        xint1 = xmax;
        yint1 = y(1) + m*(xmax - x(1));
        if yint1 > ymin && yint1 < ymax
            yint = ymin;
            xint = x(1) + (ymin - y(1))/m;
            if xint < xmin 
             xint = xmin;           
             yint = y(1) + m*(xmin - x(1));
            elseif xint > xmax
             xint = xmin;           
             yint = y(1) + m*(xmin - x(1));
             if yint > ymax
                 yint = ymax;
                 xint = x(1) + (ymax - y(1))/m;
             end
            end
        end
    end
    
end
xint = xint;
yint = yint;

end