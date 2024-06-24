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
# Our own exit status
EXIT_CODE=0
# Initialise list to be filled
extant_correlated_sessions=()

##############
# Check inputs
##############
if [ $# -eq 0 ]; then
  echo "No parameters specified!"
  echo "Usage: $0 <input_file>"
  echo "where <input_file> contains list of correlated sessions"
  EXIT_CODE=1
else
  ####################
  # Read input & match
  ####################
  # Input argument is file containing name of experiments we think have been correlated
  # This file is assumed to be nicely formatted s.t. each session is on a new line
  CORRELATED_SESSIONS_FILE=$1

  # Read the input text file line by line, parse each line
  # & fill a list of correlated sessions that exist on the flexbuff
  while read -r line; do
    temp="$(echo $line | awk '{print tolower($0)}' | xargs)"  # covert to lower case, strip white space
    if [ "$(vbs_ls -lhrt ${temp}*)" ]; then                     # list all the channels for this sesssion & scans
      extant_correlated_sessions+=("${temp}")                   # if they exist then add them to the list
    fi
  done < $CORRELATED_SESSIONS_FILE

  # Only do this if there are matches
  if [[ "${#extant_correlated_sessions[@]}" -gt 0 ]]; then
    # Print the extant correlated sessions
    echo "The correlated sessions (from your list) that we found on the flexbuff are: "
    for sess in "${extant_correlated_sessions[@]}"; do
      echo ${sess}
    done

    ###################
    # Delete matches...
    ###################
    read -p "Would you like to delete them? " -n 1 -r
    if [[ ${REPLY} =~ ^[Yy]$ ]]; then
      echo; echo "OK, let's delete them... "
      echo "Note: user input is required. Select 'a' to delete from all directories."
      for sess in "${extant_correlated_sessions[@]}"; do
        vbs_rm ${sess}*
      done
    else
      echo; echo "Goodbye!"
    fi
  else
    echo "There are no matches."
  fi
fi

exit $EXIT_CODE
