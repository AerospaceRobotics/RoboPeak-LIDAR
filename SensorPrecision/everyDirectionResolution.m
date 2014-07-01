% everyDirectionResolution.m
% Computer-side program to be run after everyDirectionReading.py,
% which records LIDAR data, groups data by angle. Assuming the LIDAR
% and environment are stationary, this program calculates and plots
% the precision of the laser measurements.

% Aerospace Robotics 2014
% Michael Searing

% d = linspace(0,6000); % millimeters
% w = 50; % millimeters
% dtheta = 0.001; % degrees
% theta = atand(d/w)+dtheta;
% res = w*tand(theta)-d;
% 
% [AX,H1,H2] = plotyy(d,res,d,100*res./d);
% 
% set(get(AX(1),'Ylabel'),'String','Resolution');
% set(get(AX(2),'Ylabel'),'String','Percentage');
% 
% xlabel('Distance');

distancesID = fopen('distances.txt','r');
resolutionID = fopen('resolution.txt','r');

distances = fscanf(distancesID,'%f');
resolution = fscanf(resolutionID,'%f');

fclose(distancesID);
fclose(resolutionID);

plot(distances,resolution,'o');