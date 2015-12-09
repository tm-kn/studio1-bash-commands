#!/bin/bash
###############################################################################
#
# wastesize - returns the number of files in ~/.waste
#
# Tomasz Knapik <u1562595@unimail.hud.ac.uk>
###############################################################################

waste_dir=$HOME'/.waste'

# Check if waste directory exists first
if [ ! -d $waste_dir ]
then
    echo 'The waste bin for this user has not been created yet.'
    exit 0
fi

# Get the number of files in the waste bin.
number_of_files=$(ls $waste_dir -1 | wc -l)

# Display a nice warning if there's no files and exit the program.
if [ $number_of_files -eq 0 ]
then
    echo 'There is no files in the waste bin.'
    exit 0
fi

# Display a number of files in the waste bin
echo 'Number of files in the waste bin: '$number_of_files

exit 0
