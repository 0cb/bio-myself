#!/bin/bash
#===========================================================================#
#=									   =#
#   Filename:	    sep.sh
#   Version:	    1.0
#=									   =#
#   Description:    trying to separate files based on regex with missing
#		    values within the increments
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-10-24 20:28
#   Updated:	    
#=									   =#
#===========================================================================#

#--------------- refs ---------------#



for file in *.png;
do    
    while read line;
    do
	if [[ "$file" == *_"$line"_* ]];
	then
	    mkdir -p ./$line
	    mv -v $file ./$line/$file >> log.txt
	fi
    done < ~/Close_Lab/small_list.txt
done 
