#!/bin/bash
#===========================================================================#
#=									   =#
#   Filename:	    avgBlock
#   Version:	    1.0
#=									   =#
#   Description:    average of rows based on regex; unequal n for each ID
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-10-29 14:10
#   Updated:	    
#=									   =#
#===========================================================================#

#--------------- ref ---------------#
#https://stackoverflow.com/questions/21077882/pattern-to-get-string-between-two-specific-words-characters-using-grep
#https://stackoverflow.com/questions/12204192/awk-multiple-delimiter
#https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash
#https://unix.stackexchange.com/questions/49624/average-rows-with-same-first-column


INPUT=$@

#while read line;
#do
    awk -F'[_\t]' '
	NR>1{
		arr[$2] += $36
		count[$2] += 1
	    }
			END{
			    for (a in arr){
					    print a","arr[a]/count[a]
					}
			    }' $INPUT > pingme.csv
#done < rats.csv

