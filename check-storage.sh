#!/bin/bash
#Author: Arthur Kalikiti
#Description: Script to check storage usage
#Email: arthur@crystaline.co.zm
#phone: 0979040735

usage=$(df -h | grep "/$" | awk '{ print $5 }' | tr -d "%")

if (( $usage < $1 )); then
    echo "OK - Disk usage is fine, usage is at $usage%";
    exit 0
elif (( $usage > $1 && $usage < $2 )); then
    echo "WARNING - You are running out of storage, usage is at $usage%";
    exit 1
elif (( $usage > $3 )); then
    echo "CRITICAL - Not enough free space, usage is at $usage%";
    exit 2
else
    echo "UNKOWN - Unable to determine state, usage is at $usage";
    exit 3
fi
