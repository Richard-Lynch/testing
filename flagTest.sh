#!/bin/bash

while getopts ":a:b-:A:B:C:" opt; do # TODO NOTE: leading : indicates that i want invalid args to be pushed into the OPTARG  
    case $opt in
         :)
            echo "option -$OPTARG requires arg" >&2
            # allows for optional args
            opt=$OPTARG
            echo "opt: $opt" >&2
            ;;&       
        a)
            echo "-a was triggered, param: $OPTARG" >&2
            ;;
        A)
            echo "-A was triggered, param: $OPTARG" >&2
            ;& # will always execute the next case
        B)
            echo "-B was triggered, param: $OPTARG" >&2
            ;;& # will look for the next matching case
        C)
            echo "-C was triggered, param: $OPTARG" >&2
            ;;
        b)
            echo "-b was triggered, param: $OPTARG" >&2
            val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
            if [[ $val ]] ; then
                echo "arg passed to b: $val"
            else
                OPTIND=$(( $OPTIND + 1 ))
            fi

            # allows opt arg, as long as b is followed by either an arg or an -opt 
            if [[ $OPTARG = -*  ]] ; then
                echo "b was trigered and next arg was a -opt" 
                ((OPTIND--))
                continue
            fi
            ;;
        -) # enables the use of -- params
            echo "an -- option was trigered"
            case "${OPTARG}" in 
                version) # --opt val
                    opt=${OPTARG}
                    val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                    echo "Parsing option: '--${opt}', value: '${val}'" >&2;
                    ;;
                version=*) # --opt=val
                    val=${OPTARG#*=}
                    opt=${OPTARG%=$val}
                    echo "Parsing option: '--${opt}', value: '${val}'" >&2
                    ;;
                loglevel) # --opt val
                    opt=${OPTARG}
                    val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                    ;;&
                loglevel=*) # --opt=val
                    val=${OPTARG#*=}
                    opt=${OPTARG%=$val}
                    ;;&
                loglevel | loglevel=*) # if either of the other log levels are true
                    echo "this works for both the other loglevels!"
                    echo "Parsing option: '--${opt}', value: '${val}'" >&2
                    ;;
                help) # --opt
                    echo "parsing option: '--${OPTARG}'" >&2;
                    ;;
                *) # --invalid_top
                    if [ "$OPTERR" = 1 ] && [ "${optspec:0:1}" != ":" ]; then
                        echo "Unknown option --${OPTARG}" >&2
                    fi
                    ;;
            esac;;
        \?)
            echo "invalid option -$OPTARG" >&2
            exit 1
            ;;

    esac
done

# # --- yes no option ---
# echo -n "Do you agree with this? [yes or no]: "
# read yno
# case $yno in
# 
#     [yY] | [yY][Ee][Ss] )
#         echo "Agreed"
#         ;;
# 
#     [nN] | [n|N][O|o] )
#         echo "Not agreed, you can't proceed the installation";
#         exit 1
#         ;;
#     *) 
#         echo "Invalid input"
#         ;;
# esac
