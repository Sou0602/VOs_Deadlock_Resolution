function get_A_b(agent)
freespace = agent.freespace;
r = freespace.regions;

function [list_a,list_b] = get_convex(region,list_in,list_out)

he
end

for j = 1:length(r)
    %To do if the process is time- taking
    %check if atleast on the regions lies in the front space. 
    %when one convex region is present in the front neglect the non-convex
    %ones
list_in = [];
list_out = [];
convhull_r = convhull(r(j));
if convhull_r.area == r(j).area
    %is convex and get Ax < b form
    list_in = [list_in ; r(j)];
    disp('isconvex')
elseif convhull_r.area > r(j).area
    disp('isnonconvex')
    %Think of a recursive function that outputs all convex polygons with in
    %or out
    neg_poly = subtract(convhull_r,r(j));
    list_in = [list_in ; convhull_r];
    if convhull(neg_poly).area == neg_poly.area
    list_out = [list_out ; neg_poly];
    else
        %repeat get_convex(regions,list_in,list_out)
    end
    
    %repeat for conv
end
    
end
end