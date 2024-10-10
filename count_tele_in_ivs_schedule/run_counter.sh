#!/bin/bash


##############################################################
get_file() {

	local FILE="$1"  # $MASTER_FILE
	local URL="$2"	 # https://cddis.nasa.gov/archive/vlbi/ivscontrol/master$YR.txt
	if ! [ -f "$FILE" ]; then
		echo "calling curl on $URL"
		if ! curl --location --cookie cookies.txt "$URL" > "$FILE"; then
			echo "Failed to download $FILE from $URL"
			exit 1
		fi
		echo "------------------------------------------------------"
	fi
	return 0
}

##############################################################

# Input is year to generate roster for...
YR="$1"

##############################################################

FILE="master${YR}.txt"

get_file "$FILE" "https://cddis.nasa.gov/archive/vlbi/ivscontrol/master$YR.txt"

echo "Counting Master Schedule"
python3 count_exps.py "$FILE"

##############################################################

#FILE="intensives${YR}.txt"

#echo "Counting Intensive Schedule"
#get_file "$FILE" "https://cddis.nasa.gov/archive/vlbi/ivscontrol/master$YR-int.txt"

#python3 count_exps.py "$FILE"
