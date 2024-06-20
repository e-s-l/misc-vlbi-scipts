#!/bin/bash
#
# check_flexbuff_nn.sh
#
# Script to confirm existence of VGOS experiment data on flexbuff
#
# Background: flexbuff vbs scripts are not designed to handle the
# file name format of nn experiments (additional underscore at end
# of name).

########
# Set-up
########
# Abort if any non-zero exit status
set -e
#
EXIT_CODE=0
#
EXTANT_CORRELATED_SESSIONS=()

#######################
# Check argument inputs
#######################
if [ $# -eq 0 ]
then
  echo "No parameters specified!"
  echo "Usage: $0 <input_file>"
  echo "where <input_file> contains list of correlated sessions"
  EXIT_CODE=1
else
  ####################
  # Read input & check
  ####################
  # Input argument is file containing name of experiments we think have been correlated
  CORRELATED_SESSIONS_FILE=$1
  # Read the input text file line by line, parse each line
  # & fill a list of correlated sessions that exist on the flexbuff
  while read -r line; do
    TEMP="$(echo $line | awk '{print tolower($0)}' | xargs)"  # covert to lower case, strip white space
    if [ "$(vbs_ls -lhrt $TEMP*)" ]; then                     # list all the channels for this sesssion & scans
      EXTANT_CORRELATED_SESSIONS+=("$TEMP")                   # if they exist then add them to the list
    fi
  done < $CORRELATED_SESSIONS_FILE
  # Print the extant correlated sessions
  echo "The correlated sessions (from your list) that we found on the flexbuff are: "
  for SESS in "${EXTANT_CORRELATED_SESSIONS[@]}"; do
    echo $SESS
  done
  ####################
  # Now delete them...
  ####################
  read -p "Would you like to delete them? " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo; echo "OK, let's delete them..."
  else
    echo; echo "Goodbye!"
  fi

fi

exit $EXIT_CODE
