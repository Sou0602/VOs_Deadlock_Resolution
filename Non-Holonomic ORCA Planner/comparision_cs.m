for i = 1:length(agents)
[normdis,~] = getnorm(agents(i));
normmax(i) = max(normdis);
normsum(i) = sum(normdis);
trajlength(i) = gettrajlength(agents(i));
[controlnorm(i),~] = getcontrolsmooth_cs(agents(i));
timeavg(i) = sum(agents(i).timedata)/length(agents(i).timedata);
end