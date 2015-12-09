#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Usage $0 [number]"
    exit
fi

modulo=$(($1%7))

echo $modulo

days=('Sunday' 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' 'Saturday')

echo ${days[$modulo]}
