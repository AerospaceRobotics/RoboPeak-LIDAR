''' everyDirectionReading.py
Computer-side program to be run with a serial-connected
Arduino (with RP LIDAR) running everyDirectionReading.ino
It produces documents further handled by everyDirectionResolution.m,
a MATLAB file.

Records LIDAR data, groups data by angle. Assuming the LIDAR
and environment are stationary, this can be used to calculate
the precision of the laser measurements.

Aerospace Robotics 2014
Michael Searing'''

import serial

# Create/Open files to store recorded data
distances = open('distances.txt','w')
resolution = open('resolution.txt','w')

# Linux
# ser = serial.Serial('/dev/tty.usbserial', 115200)
# Windows
ser = serial.Serial('COM4', 115200)

numSamp = 10000

pointList = [[0,0] for x in range(numSamp)]

i = 0
while i < numSamp+3: # number of samples to record
	if i <= 3: # clear junk
		ser.readline()
	else:
		pointLine = ser.readline() # distance and angle
		try:
			pointNum = [float(element) for element in pointLine.split()]
			if pointNum[0] < 110 or pointNum[1] >= 360.0:
				continue # skip junk
			pointList[i] = pointNum
			# print pointNum
		except:
			print "failed"
	i += 1

pointList.sort(key = lambda x: x[1]) # sort points by angle

rawDists = [point[0] for point in pointList]
rawAngles = [point[1] for point in pointList]
distList = []
resList = []

angleRes = 1.0/2
targAngles = [angleRes*x for x in range(1,int(360.0/angleRes+1))] # 0.25 .. 360.00
i = 0
j = 0 # index of current direction (0.25deg chunk)
iPrev = 0 # index of first point in chunk
while i < numSamp: # all recorded points
	curAngle = rawAngles[i] # angle of current point
	curTarg = targAngles[j] # angle at beginning of next chunk
	if curAngle >= curTarg: # current point is in or after the next chunk
		if i - iPrev > 2: # only save chunks with more than 2 points
			chunk = rawDists[iPrev:i]
			avgDistance = sum(chunk)/len(chunk)
			peak2peak = max(chunk)-min(chunk)
			if peak2peak < 50.0 and avgDistance < 7500.0:
				distList.append(avgDistance) # save average index of chunk
				resList.append(peak2peak) # save peak-to-peak resolution of data
		iPrev = i # save index of first point in next chunk
		j += 1 # move to the next chunk
	else: # current point is in current chunk
		i += 1 # move to the next point

for item in distList:
  distances.write("%s\n" % item)
for item in resList:
  resolution.write("%s\n" % item)

distances.close()
resolution.close()