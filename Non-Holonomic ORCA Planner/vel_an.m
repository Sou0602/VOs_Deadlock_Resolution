function vel_an(agents,i)

hold on ;
for k = 1:length(agents(i).obs)
    oname = str2double(agents(i).obs(k));
    CC_plot(agents(i).position, agents(oname).position,agents(oname).radius*4.6/1.6 , agents(oname).radius);
    quiver(agents(i).position(1), agents(i).position(2), agents(i).velocity(1)-agents(oname).velocity(1), agents(i).velocity(2)-agents(oname).velocity(2),'k');
end
quiver(agents(i).position(1), agents(i).position(2), agents(i).velocity(1), agents(i).velocity(2),'b');
quiver(agents(i).position(1), agents(i).position(2), agents(i).newControl(1), agents(i).newControl(2),'g');

end
