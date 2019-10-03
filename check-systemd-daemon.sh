#!/bin/bash
#Author: Arthur Kalikiti
#Description: Script to check systemd daemon(s)
#Email: arthur@kalikiti.net
#phone: 0979040735

daemon=$1
status=$(systemctl status $daemon | grep Active | awk '{ print $2 }')
since=$(systemctl status $daemon | grep Active | awk '{ print $9 }')

if (( $status == 'active' )); then
	echo "OK - $daemon daemon has been running since $since ago";
	exit 0
elif (( $status == 'failed' )); then
	echo "WARNING - $daemon daemon failed to start from $since ago";
	exit 1
elif (( $status == 'inactive' )); then
	echo "CRITICAL - $daemon daemon has been inactive since $since ago";
	exit 2
else
	echo "UNKNOWN - $daemon daemon has been in $status state since $since ago";
	exit 3
fi

