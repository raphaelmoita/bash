#!/bin/bash

# file.txt
#2020-12-02 08:22:05 2020-12-02 08:22:05 aaa
#2021-12-02 08:22:05 2020-12-02 08:22:05 bbb
#2020-12-02 08:22:05 2020-12-02 08:22:05 ccc
#2020-12-05 08:22:05 2020-12-02 08:22:05 ddd

cat file.txt | while read LINE; do   
  START=$(echo ${LINE} | cut -c1-20)   
  END=$(echo ${LINE} | cut -c21-40)  
  DATE_START=$(date --date="${START}" +%s)
  DATE_END=$(date --date="${END}" +%s)
  
  if [ ${DATE_START} -gt ${DATE_END} ]; then
	echo "Invalid record, starting date cannot be bigger ending date - ${LINE}"
  fi	
done
