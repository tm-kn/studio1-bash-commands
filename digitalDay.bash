#!/bin/bash
###############################################################################
#
# digitalDay - takes multiple numeric arguments and prints out the days of the
#              week based on the formula, number modulo 7.
#
# Example: 0 - Sunday, 1 - Monday, 2 - Tuesday, etc.
#
# Tomasz Knapik <u1562595@unimail.hud.ac.uk>
###############################################################################


usage () {
    echo "Usage $0 [positive or negative integer(s)]"
}


getDay() {
    # Check if number arguments is not valid
    if [ $# -eq 0 ]
    then
        usage
        exit 1
    fi

    # Iterate through functions arguments
    for number in "$@"
    do
        # Validate the number entered by user
        if [[ ! $number =~ ^[0-9]*$ ]] && [[ ! $number =~ ^([\+]|[\-])[0-9]*$ ]]
        then
            usage
            exit 1
        fi

        # Calculate the modulo
        modulo=$(($number%7))

        # Define the array with weekdays
        days=('Sunday' 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' 'Saturday')

        # Echo the "digital day"
        echo -e '\t'$number'%7 = '$modulo' | '${days[$modulo]}
    done

    echo ""
}


# If user wants help, give them help
for arg in "$@"
do
    if [[ $arg == *"help"* ]]
    then
        usage
        exit 0
    fi
done


# Call the function if there're any arguments,
# otherwise it will skip to the control loop
if [ $# -ne 0 ]
then
    getDay $@
fi


# Control loop
while read -r
do
    getDay $REPLY

    # If control input is -1, break the loop and set the variable to break
    # outer loop
    for number in ${REPLY[@]}
    do
        if [[ $number -eq -1 ]]
        then
            BREAK_CONTROL_LOOP=1
            break
        fi
    done

    # Break the loop if this var is set
    if [ $BREAK_CONTROL_LOOP ]
    then
        echo $0": Exiting the program..."
        break
    fi

done

exit 0
