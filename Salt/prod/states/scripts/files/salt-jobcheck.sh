#!/bin/bash
#array=$(salt-run jobs.list_jobs | grep 202209 | sed s/://g | sed "s/^/'/g" | sed "s/$/'/g")
#array=$(salt-run jobs.list_jobs | grep 202209 | sed s/://g | tail )
readarray -t array < <(salt-run jobs.list_jobs | grep 202209 | sed s/://g)

for i in "${array[@]}"; do 
	echo "${@}"
	salt-run jobs.exit_success "${i}"
	(( i++ ))
done

