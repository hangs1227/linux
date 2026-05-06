#!/bin/bash
	LOG_FILE=monitor.txt
	check_cpu()
	{
	num=80
	Cpu_us=$(top -b -n 1|grep Cpu |awk -F '[,: ]+' '{print $8}' )
	Memory_us=$(free -m |grep 内存 |awk -F '[: ]+'  '{print $4/$2*100}'
)
	if [ $( echo "$Cpu_us < $((100 - $num ))" | bc) -eq 1 ] ; then
	  msg="  $(date '+%Y-%m-%d %H:%M:%S ') [警告]  CPU不足 Cpu空闲率为: $Cpu_us%       "
	echo "$msg" |tee  -a monitor.txt  
	else
	echo "Cpu的空闲率是:$Cpu_us%  "
	fi
	if [ $( echo "$Memory_us < $((100 - $num ))"| bc) -eq 1 ];  then
	echo "内存不足"
	else
	echo "内存的空闲率是:$Memory_us%"
	fi
	   }
	while true ;  do
	clear
	check_cpu
	sleep 5
	done

