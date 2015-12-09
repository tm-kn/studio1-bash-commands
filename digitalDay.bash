#!/bin/bash
###############################################################################
#
# digitalDay - takes a single numeric argument and prints out the day of the
#              week based on the formula, number modulo 7.
#
# Example: 0 - Sunday, 1 - Monday, 2 - Tuesday, etc.
#
# Tomasz Knapik <u1562595@unimail.hud.ac.uk>
###############################################################################

usage () {
    echo "Usage $0 [number]"
}

# Check if number arguments is valid
if [ $# -ne 1 ]
then
    usage
    exit 1
fi

# Calculate the modulo
modulo=$(($1%7))

# Define the array with weekdays
days=('Sunday' 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' 'Saturday')

# Echo the "digital day"
echo $1'%7 = '$modulo' | '${days[$modulo]}

exit 0
