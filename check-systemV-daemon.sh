#!/bin/bash
#
# Author: Arthur Kalikiti
# Description: Script to check system V init script(s)
# Email: arthur@kalikiti.net
# phone: 0979040735

daemon=$1
status=$(service $daemon status | tr -d "..." | awk '{print $5}' )

if [[ -z "$status" ]]; then
	echo "CRITICAL - $daemon daemon is dead"
	exit 3
else
	echo "OK - $daemon daemon is running smoothly"
	exit 0
fi
