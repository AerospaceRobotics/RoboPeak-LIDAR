% Plotting of results from precision calculations
% for the RoboPeak LIDAR unit.

%% SETUP
d = linspace(0,6000); % millimeters
w = 50; % millimeters

dtheta1 = 0.001; % degrees
theta1 = atand(d/w)+dtheta1;
res1 = w*tand(theta1)-d;

dtheta2 = 0.008; % degrees
theta2 = atand(d/w)+dtheta2;
res2 = w*tand(theta2)-d;

%% FUZZ DATA
fuzz = [113.55	0.25
    118.2875	0.25
    205.45	0.5
    276.9125	0.75
    328.225	0.5
    367.7625	0.5
    373.075	1.25
    476.7	1.25
    564.7875	1.25
    671.1125	2
    846.875	2
    2103.25	4.5
    3004.90625	3.25
    3456.4875	3.5
    3457.3125	6
    3578.888889	5
    3974.2875	4.5
    4466.961538	5.75
    5107.5	2.5
    5637.4625	6.25
    5939.75	10
    6289.6667	3.75
    7108.25	7.25];
%% OUTLIER DATA
outliers = [113.55	0.25
    118.2875	0.25
    205.45	0.5
    262.6805556	2.5
    276.9125	0.75
    328.225	0.5
    367.7625	0.5
    373.075	1.25
    476.7	1.25
    564.7875	1.25
    671.1125	2
    846.875	2
    952.775	4.5
    985.8875	4
    1024.2875	4.75
    1189.9875	5.25
    1401.5875	6.75
    1406.1	9.25
    1515.3	7.5
    1808.45	16
    1944.9625	9.75
    2095.069444	13.25
    2103.125	13.5
    2166.7625	18.75
    2167.3625	12.25
    2167.675	12.75
    2303.0125	12.5
    2351.4625	32.25
    2635.5125	18.5
    2677.3875	20.75
    2736.2	20.25
    3432.7125	31.75
    3852.7	40.5
    4444.575	47
    5022.2875	69.25
    5387.6125	89.5
    6063.9125	102];
%% PLOTTING

% [AX,H1,H2] = plotyy(d,res,d,100*res./d);
%
% set(get(AX(1),'Ylabel'),'String','Resolution');
% set(get(AX(2),'Ylabel'),'String','Percentage');

hold on;
plot(d,res1,'b:','linewidth',2);
plot(d,res2,'r:','linewidth',2);
plot(fuzz(:,1),fuzz(:,2),'k','linewidth',2);
plot(outliers(:,1),outliers(:,2),'color',[0 0.75 0],'linewidth',2);
plot(d,0.0011*d,'b','linewidth',2);
plot(d,d/1000*0.0026.*d,'r','linewidth',2);
xlabel('Distance [mm]','FontSize', 15); ylabel('Resolution [mm]','FontSize', 15);
h = legend('$0.001^o$ Sensor Resolution','$0.008^o$ Sensor Resolution', ...
    'Filtered Data','Data with Outliers','$0.11\%$','$(d[m]*0.26)\%$',...
    'location','northwest');
title('Resolution of RPLidar','FontSize', 17);
set(gca, 'FontSize', 13); axis tight; set(h,'interpreter', 'latex')