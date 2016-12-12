#!/bin/bash

echo "Initialize permissions"
source ../catkin_ws/devel/setup.bash

for file in *.bag
do
	f="${file%.*}"
	echo "processing" $file" file.."
	echo "imu readings"
	imutxt="_IMU.txt"
	rostopic echo -b $file -p /imu_readings > $f$imutxt
	echo "mag readings"
	magtxt="_MAG.txt"
	rostopic echo -b $file -p /mag_readings > $f$magtxt
	echo "remote readings"
	remtxt="_REMOTE.txt"
	rostopic echo -b $file -p /remote_readings > $f$remtxt
	echo "control readings"
	remtxt="_CONTROL.txt"
	rostopic echo -b $file -p /control_readings > $f$remtxt
	echo "creating folder"
	mkdir $f
	ext="_*"
	rm $file
	mv $f$ext $f/
	mv $f ../logs/
	echo "done"
done

echo "All files converted !"
echo "                     "
echo "            ____     "
echo "     ___// (YAY!)    "
echo "    /.__.\  |/       "
echo "    \ \/ /           "
echo "  __/    \           "
echo "  \-      )          "
echo "    \____/           "
echo "  ____|_|________    "
echo "      " "            "