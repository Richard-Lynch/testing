#!/bin/bash

if [ 1 -eq 1 ] ; then
    echo "1 does eq 1, woo"
    orig="the_original_line"
    newl="\
\" changed by Richard Lynch edits file \n\
if ln > 0 \n\
    exe 'sign place '.id.' name=ShowMark'.nm.' line='.ln.' buffer='.winbufnr(0)\n\
endif\n\
\" end of change  by Richard Lynch\
"

    sed -e "s/$orig/$newl/" $1 > ./tempChangeLineFile ;
    cp ./$1 ./$1.orig
    mv ./tempChangeLinefile ./$1 ; 
    vim $1;
    mv ./$1.orig ./$1 ;
else
    echo "pretty sure 1 == 1"
fi

