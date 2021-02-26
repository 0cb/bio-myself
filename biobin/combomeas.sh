#!/bin/bash
#===========================================================================#
#=									   =#
#   Filename:	    combomeas.sh
#   Version:	    1.0
#=									   =#
#   Description:    combine measurements from csvs per subdir
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-10-25 13:10
#   Updated:	    
#=									   =#
#===========================================================================#

#--------------- refs ---------------#

#https://www.linuxcommands.site/linux-commands/use-the-linux-command-to-find-the-max-value-and-print/
#https://www.unix.com/shell-programming-and-scripting/270072-awk-select-lines-maximum-value-each-record-based-column-value.html
#https://stackoverflow.com/questions/3746947/get-just-the-integer-from-wc-in-bash
#https://stackoverflow.com/questions/3137094/how-to-count-lines-in-a-document
#https://unix.stackexchange.com/questions/170204/find-the-max-value-of-column-1-and-print-respective-record-from-column-2-from-fi

DIA=/home/cb/Bioinf0cb/projects/fieldDIA
CLO=/home/cb/Close_Lab/HOLD

for dir in *;
do
    echo $dir
    if [ -d "${dir}" ];
    then
	cd $dir
	for i in *.csv;
	do
	    line=$(wc -l < $i)
	    #echo $line
	    if  (( line > 2 ));
	    then
		# field sep=\t, set 0 counter and compare against each line
		awk -F'\t' -v max=0 'NR>1 {if($6>max){line=$0; max=$6}}END{print line}' $i > new_$i	#keeping new_$i as tmps to be safe
		cat new_$i >> $CLO/"$dir"_meas.csv
		#Rscript $DIA/combo.R > new_$i.csv
	    else
		cp $i new_$i
		cat new_$i >> $CLO/"$dir"_meas.csv
	    fi
	done
	cd ..	    #get back to main dir; doesn't cycle back automatically
    fi
done

cd $CLO
	## find . -name 'pattern*.ext' -type f -delete ## recursive through all sub dir
for meas in *;
do
    awk '!/Label/' $meas > final_$meas
done

cat final_* >> master_meas.csv



