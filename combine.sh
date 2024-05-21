#!/usr/bin/bash
while read line
do
    echo $line >> $2
done < $1

echo -e '\n' >> $2
