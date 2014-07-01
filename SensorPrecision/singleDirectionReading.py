''' singleDirectionReading.py
Computer-side program to be run with a serial-connected
Arduino (with RP LIDAR) running singleDirectionReading.ino
It produces documents further handled by singleDirectionResolution.m,
a MATLAB file.

Records LIDAR data in a single direction. Assuming the LIDAR
and environment are stationary, this can be used to calculate
the precision of the laser measurements.

Aerospace Robotics 2014
Michael Searing'''

import serial

distances = open('distances.txt','w')
resolution = open('resolution.txt','w')

# Linux
ser = serial.Serial('/dev/ttyUSB0', 115200)
# Windows
# ser = serial.Serial('COM4', 115200)

numDist = 10
numSamp = 20

distList = range(numDist)
resList = range(numDist)
for i in distList: # number of distances to record

	# wait for user to position sensor
	raw_input("[Enter] when LIDAR is at constant distance from flat object")

	while True:
		rawDistList = range(numSamp)
		tempDistList = range(numSamp)

		ser.write(" ")
		for j in tempDistList: # number of samples to record per distance
			pointLine = ser.readline()
			try:
				pointNum = [float(element) for element in pointLine.split()]
				rawDistList[j] = pointNum[0]
				print "angle:",pointNum[1],"distance:",pointNum[0]
			except:
				print "failed"
		ser.write(" ") # stop reading

		avgDistance = float(sum(rawDistList))/len(rawDistList)
		tempDistList = rawDistList
		# # remove outliers
		# tempDistList = [dist for dist in rawDistList if abs(dist - avgDistance) < 0.005*avgDistance]
		# try: # if there are easily removable outliers
		avgDistance = float(sum(tempDistList))/len(tempDistList)
		peak2peak = (max(tempDistList)-min(tempDistList))
		distList[i] = avgDistance
		resList[i] = peak2peak
		print "Points Filtered: ",numSamp-len(tempDistList)
		print "Average Distance: ",distList[i]
		print "Deviation: ",resList[i]
		# except: # outliers indistinguishable from data
		# 	distList[i] = 0.0
		# 	resList[i] = 0.0
		# 	print "Division by 0"

		response = raw_input("Accept data? [Y/n]: ")
		if response != "n":
			break


for item in distList:
  distances.write("%s\n" % item)
for item in resList:
  resolution.write("%s\n" % item)

distances.close()
resolution.close()