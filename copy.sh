#!/bin/bash
if [ "$#" -ne 1 ]; then
        echo "Pasting from ssh clipboard" ;
        xclip -o > ~/shared/clip ;
else
        echo "Pasting from ssh file" ;
        cat $1 > ~/shared/clip ;
fi
# cat $1 > ~/shared/clipFile  ;

