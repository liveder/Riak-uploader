#!/bin/bash
SERVER="*server_name*"
bucket="*bucket*"
IFS=$(echo -en "\n\b")
FOLDER=`pwd`
for file in $(find $FOLDER -type f); do
    file_name=`basename "$file"`
    file_type=`file -i "$file"|cut -d " " -f2|tr -d ";"`
    curl -v -XPOST -H "Content-Type: $file_type" --data-binary @"$file" "http://$SERVER:8098/riak/$bucket/$file_name"
done
