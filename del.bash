#!/bin/bash
########################################################
# del - a command which moves a file to the waste bin.
#
# Tomasz Knapik
########################################################


waste_dir=$HOME'/.waste'

# If a waste bin does not exist at the home directory, then create it.
if [ ! -d $waste_dir ]
then
    mkdir $waste_dir
fi

# Check number of arguments.
if [ $# -eq 0 ]
then
    echo 'Usage: '$0' must have at least one argument.'
    echo $0' takes a filename(s) as a parameter(s) and moves it to the waste bin.'
    exit
fi

# Loop through the arguments
for filename in "$@"
do
    # Check if the file or directory exists
    if [ -e $filename ]
    then
        mv $filename $waste_dir/
    else
        echo 'File '$filename' does not exist.'
    fi
done
