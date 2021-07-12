function sides = combinatorial_allotment(agents,cluster_list)

sides = 2 * ones(1,length(agents));


x = zeros(1,length(cluster_list));
y = zeros(1,length(cluster_list));

for k = 1:length(cluster_list)
oname = str2double(cluster_list(k));

x(k) = agents(oname).position(1);
y(k) = agents(oname).position(2);
end
x = [x,x(1)];
y = [y,y(1)];
n = length(cluster_list);
P = polyshape(x,y);
[gx,gy] = centroid(P);

Q = [];
for i = 1 : length(x) - 1 
Qi = polyshape([gx,x(i),x(i+1)], [gy,y(i),y(i+1)]);
Q = [Q,Qi];
end

%%%%
% Find distances from each side of the velocity spaces and assign the
% weights to the region for choosing that particular side
for i = 1:length(cluster_list)
    aname = str2double(cluster_list(i));
    rdist = [];
    ldist = [];
    for j = 1:length(Q)
        [x,y] = centroid(Q(j));
       rdist = [rdist,norm(agents(aname).rcentroid-[x,y])];
       ldist = [ldist,norm(agents(aname).lcentroid-[x,y])];
    end
    [~,agents(aname).minr] = min(rdist);
    [~,agents(aname).minl] = min(ldist);
end
%%%
    %closest Q to the velocty space gets costed
perm = dec2bin(2^(length(cluster_list))-1:-1:0);
qweights = zeros(size(perm,1),length(Q));
for i = 1:size(perm,1)
    for j = 1:size(perm,2)
        aname = str2double(cluster_list(j));
        if perm(i,j) == '0'
            q = agents(aname).minr;
            qweights(i,q) = agents(aname).rshape.area;
        elseif perm(i,j) == '1'
            q = agents(aname).minl;
            qweights(i,q) = agents(aname).lshape.area;
        end
    end
end
qzero = qweights == 0;

qsum0 = sum(qzero,2);

nz = [];
n1 = [];
for i = 1:length(qsum0)
    if qsum0(i) == 0
        nz = [nz,i];
    end
    
    if qsum0(i) == 1
        n1 = [n1,i];
    end
end
qsum = sum(qweights,2);
if ~isempty(nz)
[maxqval,maxq] = max(qsum(nz));
  if maxqval == qsum(end)
    sides_char = perm(16,:);
  end
  sides_char = perm(nz(maxq),:);
else
[~,maxq] = max(qsum(n1));
sides_char = perm(n1(maxq),:);
end

for k = 1:length(sides_char)
    sides(k) = str2double(sides_char(k));
end

end