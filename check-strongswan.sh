#!/bin/bash
#
# Author: Arthur Kalikiti
# Description: Script to check status of any daemon that has the status flag
# Email: arthur@kalikiti.net
# phone: 0979040735

daemon=$1
status=$($daemon status )

if [[ -z "$status" ]]; then
	echo "CRITICAL - $daemon daemon is dead"
	exit 3
else
	echo "OK - $daemon daemon is running smoothly"
	exit 0
fi
