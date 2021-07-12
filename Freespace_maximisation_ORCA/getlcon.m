function [A,B] = getlcon(region_list)
A = [];
B = [];

for i = 1 : length(region_list)
    a = [];
    b = [];
    vx = region_list(i).Vertices(:,1);
    vy = region_list(i).Vertices(:,2);
    [xg,yg] = region_list(i).centroid;
    xmax = max(vx);
    xmin = min(vy);
    a = [1 0 ; -1 0];
    b = [xmax ; -xmin];
    vx = [vx;vx(1)];
    vy = [vy;vy(1)];
    for j = 1 : length(vx)-1
        m = (vy(j+1) - vy(j)) / (vx(j+1) - vx(j));
        c = vy(j) - m * vx(j);
        if m == Inf || m == -Inf
        c = -vx(j);
        if xg - c < 0
            a = [a ; 1 0];
            b = [b ; -c];
        elseif xg - c > 0
            a = [a ; -1 0];
            b = [b ; c];
        end
        else
        centroid_val = m * xg - yg + c;
        
        if centroid_val < 0
            a = [a ; m -1];
            b = [b ; -c];
        elseif centroid_val > 0
            a = [a ; -m 1];
            b = [b ; c];
        end
        end
    end
    A = [A;a];
    B = [B;b];
end
end