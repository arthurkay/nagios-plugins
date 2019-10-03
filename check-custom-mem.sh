#!/bin/bash

#Author: Arthur Kalikiti
#Description: Script to check memory usage
#Email: arthur@kalikiti.net
#phone: 0979040735

resp=$(free -mt | grep "Mem" | awk '{print $3}')
#echo res = $(printf "%f" 50)
if (($resp <= $1)); then
echo "OK - $resp MB of memory used"
exit 0

elif (($resp >= $1 && $resp <= $2)); then
echo "WARNING - $resp MB of memory used"
exit 1

elif (($resp >= $3)); then
echo "CRITICAL - $resp MB of memory used"
exit 2

else

echo "UNKNOWN - $resp MB memory used"
exit 3

fi

