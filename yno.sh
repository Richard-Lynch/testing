#!/bin/bash

# usage;    source yno      ( source /home/norm/programs/scripts/yno.sh
#           call yno        ( yno )
#           check output    ( if [[ yno_response == 1 ]] ... elif [[ ... ==0 ]] etc)

yno() {
echo -n "Do you agree with this? [yes or no]: " >&2
read yno
case $yno in
    [yY] | [yY][eE][sS] )
        echo "you chose yes!"
        yno_response=1
        return
        ;;
    [nN] | [nN][oO] )
        echo "you chose no!"
        yno_response=0
        return
        ;;
    *)
        echo "you chose an invalid option"
        yno_response=-1
        echo "invalid option"
        return 
        ;;
esac
}

