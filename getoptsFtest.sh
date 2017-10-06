#!/bin/bash

echo "running the get opts test file"

newCreate () {
#     echo "starting"
    while getopts ":a" opt; do
        case $opt in 
            :)
                echo "option -$OPTARG requires arg" >&2
                ;;
            a)
                echo "-a was triggered, param: $OPTARG" >&2
                ;;
            ?)
                echo "unknown arg: $OPTARG" >&2
                ;;
        esac
    done 
    echo "done!"
}
