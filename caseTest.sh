#!/bin/bash

while getopts "a:A:B:-:" opt; do # TODO NOTE: leading : indicates that i want invalid args to be pushed into the OPTARG  
    case $opt in
        a)
            echo "-a was triggered, param: $OPTARG" >&2
            ;; # always stops
        A)
            echo "-A was triggered, param: $OPTARG" >&2
            ;;& # tests to see if any other conditions were met
        B)
            echo "-B was triggered, param: $OPTARG"
            ;;& # tests to see if any other conditions were met
        C)
            echo "-C was triggered, param: $OPTARG"
            ;; # can be skipped by the above checks
        [AB])
            echo "A or B was triggered, param: $OPTARG"
            ;; # Could be either of the other options
        [BA])
            echo "this will never be matched"
            ;; # the above option acts as a guard to this
        D)
            echo "-D was triggered, param: $OPTARG"
            ;& # always falls through
        E)
            echo "-E was triggered, param: $OPTARG"
            ;; #always stops
    esac
done
