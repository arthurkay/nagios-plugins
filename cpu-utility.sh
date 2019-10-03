#!/bin/bash
#Author: Arthur Kalikiti
#Description: Script to check memory usage
#Email: arthur@kalikiti.net
#phone: 0979040735

cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}' | xargs printf '%.0f')

if (($cpu <= $1)); then
echo "OK - CPU Usage is at $cpu%"
exit 0

elif (($cpu >= $2)); then
echo "WARNING - CPU Usage is at $cpu%"
exit 1

elif (($cpu >= $3)); then
echo "CRITICAL - CPU Usage is at $cpu%"
exit 2

else
echo "UNKNOWN - CPU Usage is at $cpu%"
exit 3

fi

