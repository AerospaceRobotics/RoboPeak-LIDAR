RoboPeak-LIDAR
==============

Evaluation, characterization, and driving code for the RoboPeak LIDAR unit.

## Contents:

### RoboPeak Drivers
The drivers provided by RoboPeak, used to assist communication with the RP LIDAR unit in our evaluation code. Also hosted on their website at http://rplidar.robopeak.com/sdk
##### RPLidar.h
Header file for the RPLidar Arduino Drivers. Used to import methods into Arduino sketches.
##### RPLidar.cpp
Methods for connecting to, sending commands to, and receiving data from the RP LIDAR unit.
##### keywords.txt
A file containing method names, etc. used for context coloring by the Arduino IDE
#### inc
Files used under the hood by RPLidar.cpp - all will be included in a sketch through RPLidar.h
#### examples
##### simple_connect.ino 
Demonstrates use of the drivers and was used as a template by us
##### distance_to_color
Expands simple_connect for use with an RGB LED; we prefered to use an Arduino with multiple serial ports.

### SensorPrecision
Overall, we found that the sensor was, as advertised, more precise than %1 of the range throughout its operational range (~0.2-7m). Precision is higher on more reflective surfaces, and a small amount of filtering outliers increased precision from square with range to linear with range.
##### theoreticalResolution.m
MATLAB file for generating plot of these results.
#### Read Every Direction
##### everyDirectionReading.ino
Arduino-side file for reading and sorting the data from a RoboPeak LIDAR unit connected to an Arduino.
##### everyDirectionReading.py
Computer-side file for reading, sorting, and porting to file the data from a RoboPeak LIDAR unit connected to an Arduino.
##### everyDirectionResolution.m
Computer-side file to be run after everyDirectionReading.py to calculate the precision of the laser sensor after recording sample data.
#### Read Single Direction
##### singleDirectionReading.ino
Arduino-side file for reading and sorting the data from a RoboPeak LIDAR unit (in a single direction) connected to an Arduino
##### singleDirectionReading.py
Computer-side file for reading, sorting, and porting to file the data from a RoboPeak LIDAR unit (in a single direction).
##### singleDirectionResolution.m
Computer-side file to be run after singleDirectionReading.py to calculate the precision of the laser sensor in a single direction after recording data.

### MotorSpeed
##### motorSpeedMapping.fig
A plot of the reported rotation speeds correlated with PWM commands.
##### motorSpeedMapping.m
Matlab file used to generate plot.