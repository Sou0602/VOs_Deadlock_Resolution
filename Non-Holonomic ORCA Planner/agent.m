classdef agent < matlab.mixin.Copyable
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name
        position
  
        goal
        path
        vmax
        sensorRange
        radius
        newspeed
        newomega
        velocity
        sen_angle
        newControl
        prevfov
        
    end
    
    methods
        function obj = agent(name, position, velocity, goal,vmax)
            %UNTITLED5 Construct an instance of this class
            %   Detailed explanation goes here
            obj.name = name;
            obj.position=position;
            obj.velocity=velocity;

            obj.goal=goal;
            obj.path=[];
            obj.vmax=vmax;
            obj.sensorRange=5;
            %obj.radius=0.5;
            obj.newControl=[];
            obj.sen_angle=45;
            obj.radius=.5;
            obj.newspeed=0;
            obj.newomega=0;


        end

    end
end

