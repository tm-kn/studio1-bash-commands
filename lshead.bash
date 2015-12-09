#!/bin/bash
##################################################
#
#
#
##################################################

option=$1
lines_to_list=$2
directory=$3

if [ $# -ne 3 ]
then
    echo "Usage "$0": [-head/-tail] [number of lines] [directory]"
    echo "Lists last or first n number of lines of every file in"
    echo "specified directory"
    exit
fi

if [ ! -d $directory ]
then
    echo $directory" does not exist or is not a directory."
    exit
fi

for file in $directory"/"
do
    if [ $option == "-head" ] || [ -z $option ]
    then
        head -n $lines_to_list $file
    elif [ $option == "-tail" ]
    then
        tail -n $lines_to_list $file
    else
        echo "Not valid option"
    fi
done
