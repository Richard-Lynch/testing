#!/bin/bash

name="./hello.asm"
echo $name
newName=$(basename $name)
echo $newName
newerName="${newName%.*}"
echo $newerName
