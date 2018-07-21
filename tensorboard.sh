#!/bin/bash
# last_ip_byte=`ifconfig | egrep -o "inet addr:[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | head -n 1 | egrep -o [0-9]*$`
# Capable of getting last ip byte on both titan and xsede. This assumes
# that the first 3 bytes for each clusters normal login node will not
# change. 
last_ip_byte=`ifconfig 2>&1 | egrep -o "128\.182\.108\.[0-9]+|160\.91\.205\.[0-9]+" | head -n 1 | egrep -o [0-9]*$`;
echo "Last ip byte = $last_ip_byte"
#logs=Logs/`ls Logs | python -c "import sys; print(sys.stdin.readlines()[-1].strip())"`
logs=Logs/`ls Logs | egrep [0-9]+ | tail -n 1`
echo "Opening tensorboard on $logs";
tensorboard --logdir $logs;
exit 0;
