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

invalid_input=0
valid_input=0
break_control_loop=0


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
            echo -e "\t"$number" is an invalid value (not an integer)."
            invalid_input=$(($invalid_input + 1))
            continue
        fi

        # Calculate the modulo
        modulo=$(($number%7))

        # Define the array with weekdays
        days=('Sunday' 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' 'Saturday')

        # Echo the "digital day"
        echo -e '\t'$number'%7 = '$modulo' | '${days[$modulo]}

        valid_input=$(($valid_input + 1))
    done

}


# Echo usage information if no arguments were provided
if [ $# -eq 0 ]
then
    usage
    exit 1
fi


# -help option
if [[ $1 == "-help" ]]
then
    usage
    exit 0
fi

getDay $@
echo ""


# If any of the arguments is valid, output usage information
if [ $valid_input -lt 1 ]
then
    usage
    exit 1
fi


# Control loop
while read -r
do
    # If control input is -1, break the loop and set the variable to break
    # outer loop
    for number in ${REPLY[@]}
    do
        if [[ $number == -1 ]]
        then
            break_control_loop=1
            break
        fi

        getDay $number
    done
    echo ""

    # Break the loop if this var is set
    if [ $break_control_loop -eq 1 ]
    then
        echo $0": Exiting the program..."
        break
    fi

done

echo "Valid inputs: "$valid_input
echo "Invalid inputs: "$invalid_input

exit 0
