#!/bin/bash

sed -i '/./,$!d' test.txt
# sed -i '/^#!/ d' test.txt

# version=3
# fileString="$(which python$version)"
# echo $fileString
echo "" >> test.txt
sed -i '1itask goes here' test.txt
