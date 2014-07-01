% singleDirectionResolution.m
% Computer-side program to be run after singleDirectionReading.py,
% which records LIDAR data from a single direction. Assuming the LIDAR
% and environment are stationary, this program calculates and plots
% the precision of the laser measurement.

% Aerospace Robotics 2014
% Michael Searing

distancesID = fopen('distancesSorted.txt','r');
resolutionID = fopen('resolutionSorted.txt','r');

d = fscanf(distancesID,'%f');
res = fscanf(resolutionID,'%f');

fclose(distancesID);
fclose(resolutionID);

plot(d,res,'o');

% [AX,H1,H2] = plotyy(d,res,d,100*res./d);
% 
% set(get(AX(1),'Ylabel'),'String','Resolution');
% set(get(AX(2),'Ylabel'),'String','Percentage');
% set(H1,'Marker','o','LineStyle','none');
% set(H2,'Marker','o','LineStyle','none');
% 
% xlabel('Distance');