#!/bin/bash

#Variables
counter=0

#Input Parameters
choice=$1
temp=$2
folder=$3

#Parsing Date
cut_params=("7-11" "4-5" "1-2")
for x in {0..2}; do
    date+=$(echo $temp | cut -c ${cut_params[$x]})
    if [ $x -lt 2 ]; then
        date+="-"
    fi
done

#Folder Check
if ! [ -d $folder ]; then
    mkdir $folder
fi

filenames=($(ls))
for x in "${!filenames[@]}"; do
    if [[ ${filenames[x]} = "mymov" ]]; then
         test=$x
    fi
done

echo "Number of files in current directory before moving: $(ls | wc -w)"

for ((i=$(ls | wc -w)-1; i>=0; i--)); do
    if [ -f ${filenames[$i]} ] && ! [ $i -eq $test ]; then
        file_date=$(stat -c '%y' ${filenames[$i]} | cut -c 1-10)
        if [ $choice = '-O' ]; then
            if [[ $date > $file_date ]]; then
                mv ${filenames[$i]} $folder
                ((counter++))
            fi
        elif [ $choice = '-N' ]; then
            if [[ $date < $file_date ]]; then
                mv ${filenames[$i]} $folder
                ((counter++))
            fi
        else
            echo "Error: Invalid Choice Parameter"
            break
        fi
    fi
done

echo "Number of files in current directory after moving: $(ls | wc -w)"
echo "Moved $counter number of files to folder $folder"