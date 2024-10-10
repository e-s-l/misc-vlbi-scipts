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

process_file() {

    echo "processing $FILE"

	local NN_COUNT=0
    local NS_COUNT=0
	local TOTAL_COUNT=0
    #
	local FILE="$1"
	local OUTPUT_FILE="$2"

	NN_EXP_COUNT = grep Nn $FILE | wc -l

	while read -r line
	do
        echo -e "old line: \n $line"
		if ! [[ $(echo "$line" | grep "\\---") ]]; then
			#
			if [[ $(echo "$line" | grep " -") ]]; then
				line=$(echo "$line" | cut -d ' ' -f1)	 #this deletes the cancelled exps from the string
				echo -e "new line: \n $line"
			fi
			#
			if [[ $(echo "$line" | grep -E "Nn|Ns|NnNs") ]]; then
				#echo "$EXP_STATIONS"
				(( TOTAL_COUNT++ ))
			fi
		fi
	done < $FILE

	echo "$TOTAL_COUNT"

}


##############################################################
main () {

    # Input is year to generate roster for...
    YR="$1"

    FILE="master${YR}.txt"

    get_file "$FILE" "https://cddis.nasa.gov/archive/vlbi/ivscontrol/master$YR.txt"

    process_file "$FILE" "$OUTPUT_FILE"

}

##############################################################

main $1
