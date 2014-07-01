% Relationship between PWM commands and rotation rate
% for the RoboPeak LIDAR unit
data = [100	1.10;
    110	1.39;
    120	1.69;
    130	2.00;
    140	2.28;
    150	2.58;
    160	2.90;
    170	3.19;
    180	3.52;
    190	3.85;
    200	4.15;
    210	4.47;
    220	4.79;
    230	5.14;
    240	5.49;
    250	5.80;
    255	5.87;];
plot(100*data(:,1)/255,data(:,2));
xlabel('PWM %');
ylabel('Rotation Rate [Hz]');
