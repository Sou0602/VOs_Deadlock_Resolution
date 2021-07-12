function region_list = delaunay_regions(agent)
freespace = agent.freespace;
translate_freespace = translate(freespace,-agent.position);
regions = freespace.regions;
region_list = [];

for i = 1:length(regions)
    rx = regions(i).Vertices(:,1);
    ry = regions(i).Vertices(:,2);
    for n = 1 : length(rx)
        if isnan(rx(n)) || isnan(ry(n)) || rx(n) == Inf || ry(n) == Inf
            rx(n) = [];
            ry(n) = [];
        end
    end
    conn = delaunay(rx,ry);
    
    for j = 1:size(conn,1)
        trix = [rx(conn(j,1)),rx(conn(j,2)),rx(conn(j,3)),rx(conn(j,1))];
        triy = [ry(conn(j,1)),ry(conn(j,2)),ry(conn(j,3)),ry(conn(j,1))];
        tri = polyshape(trix,triy);
        k = intersect(regions(i),tri);
        
       if k.NumRegions ~= 0
           region_list = [region_list,tri];
       end
    end
end

end