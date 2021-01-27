#!/bin/bash 

SINCE="2020-12-01 00:00:00"
COMMIT_MESSAGES='Bumping version\|Bulk Update'

git ls-tree -r --name-only HEAD | grep .json | while read FILENAME; do 	
	LOG="$(git log -n 10 --since=${SINCE} --pretty=format:"%ai %s" --date=short -- ${FILENAME} | grep -v ${COMMIT_MESSAGES})"
	if [ -n "${LOG}" ]; then
		echo "${LOG} - ${FILENAME}"
	fi
done
