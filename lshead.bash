#!/bin/bash
###############################################################################
#
# lshead - Lists last or first n number of lines of every file in a specified
#          directory
#
# Tomasz Knapik <u1562595@unimail.hud.ac.uk>
###############################################################################

option=$1
lines_to_list=$2
directory=$3

usage () {
    echo "Usage "$0": [-head/-tail] [number of lines] [directory]"
    echo "Lists last or first n number of lines of every file in"
    echo "specified directory"
}

# Check if number of arguments is valid
if [ $# -ne 3 ]
then
    usage
    exit 1
fi

# Check if user types a directory as an argument
if [ ! -d $directory ]
then
    echo $directory" does not exist or is not a directory."
    exit 1
fi

# Create array with all files
files=$(ls -1 $directory )

for file in $files
do
    # If file in the loop is directory, then skip it.
    if [ -d $file ]
    then
        continue

    # If option is -head
    elif [ $option == "-head" ] || [ -z $option ]
    then
        head -n $lines_to_list $directory/$file

    # If option is -tail
    elif [ $option == "-tail" ]
    then
        tail -n $lines_to_list $directory/$file

    # Any else option is not valid
    else
        usage
        # Finish the program
        exit 1
    fi
done

exit 0
