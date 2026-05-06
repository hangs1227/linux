#!/bin/bash
	folder="folder"
	if [ -d "$folder" ];  then
	echo  "文件存在"
    else
	echo  "文件不存在"  
	mkdir "$folder"
	fi
