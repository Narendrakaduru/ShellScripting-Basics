#!/bin/bash

echo "########################################### Print Date ###########################################"
echo `date`

#cpu use threshold
cpu_threshold='80'

#mem idle threshold
mem_threshold='100'

#---cpu
cpu_usage () {
cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
cpu_use=`expr 100 - $cpu_idle`
echo "########################################### CPU Utilization ###########################################"
 echo "cpu utilization: $cpu_use"
if [ $cpu_use -gt $cpu_threshold ]
    then
        echo "cpu warning!!!"
    else
        echo "cpu ok!!!"
fi
}

#---mem
mem_usage () {
 #MB units
mem_free=`free -m | grep "Mem" | awk '{print $4+$6}'`
echo "########################################### Memory Utilization ###########################################"
 echo "memory space remaining : $mem_free MB"
if [ $mem_free -lt $mem_threshold  ]
    then
        echo "mem warning!!!"
    else
        echo "mem ok!!!"
fi
}
cpu_usage
mem_usage
