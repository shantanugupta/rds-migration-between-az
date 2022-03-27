#!/bin/bash

#rm -f ./output/*.out
sleep 1s

while IFS=',' read -ra line;do
    server=$(echo "${line[0]}" | xargs)
    severity=$(echo "${line[1]}" | xargs)

    if [[ $server != \#* ]]
    then
        echo "Processing - $server"
        instance=$server
        profile=dev-long-term-mfa
        output=json
        severity=$severity
        ./switch-az.sh $instance $profile $output $severity &
    else
        echo "Skipping - $server"
    fi
done < rds.txt
