#!/bin/bash

White="\e[97m"
Black="\e[39m"
Dark_gray="\e[90m"
Light_gray="\e[37m"
Red="\e[31m"
Light_red="\e[91m"
Green="\e[32m"
Light_green="\e[92m"
Yellow="\e[33m"
Light_yellow="\e[93m"
Blue="\e[34m"
Light_blue="\e[94m"
Magenta="\e[35m"
Light_magenta="\e[95m"
Cyan="\e[36m"
Light_cyan="\e[96m"

list=($Light_gray $Light_red $Light_gray $Blue $Light_gray $Light_cyan $Light_blue $Light_gray $Light_green $Light_gray $Light_magenta $Light_blue $Light_green $White)
str2="]"


while read CMD
do
  listline+=("$CMD")
  nbpara=0
  numb=0
  string=""
  defline=()
  listtemp=()
  result=()

	for i in ${listline[@]}
	do
	  str1="${i: -1}"
	        if [ "$str1" == "$str2" ] 
		then
			if [ "$numb" -eq "0"   ]
			then
			  defline+=("$i")
			else
			  string="$string $i"
			  defline+=("${defline[@]}" "$string")
			fi
	          listtemp=()
	          numb=0
		  string=""
		  nbpara=$((nbpara+1))
	        else
		  string="$string $i"
	          numb=$((numb+1))
	        fi
	done
		
	result=("${defline[@]}" "$string")
	nbpara=$((nbpara+1))	
	
	for p in $(seq 0 $nbpara);
	do
	  echo -en  \ ${list[$p]} ${result[$p]}
	done
  printf "\n\n"
  listline=()
done


