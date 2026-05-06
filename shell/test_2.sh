 #!/bin/bash
	LOG_FILE="log.txt"
	if [ ! -f "$LOG_FILE" ]; then
	echo "文件不存在"
	fi

	count=$( grep -i -c "error"  log.txt )
	if [ $count -eq 0  ]; then
	echo "文件没有error"
	else
	echo "错误总数为：$count"
	fi

	if [ $count -gt 0 ];  then
	grep "ERROR" "$LOG_FILE" |awk -F ':' '{print $2}' >error_reporter.txt
        fi
