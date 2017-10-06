#!/bin/bash

INPUT="https://github.com/Richard-Lynch/DSA_EG.git"
SUBSTRING=${INPUT%.git*}
echo $SUBSTRING
SUBSTRING=${SUBSTRING#*Lynch/}
echo $SUBSTRING
echo $SUBSTRING

result=${PWD##*/}
echo $result
