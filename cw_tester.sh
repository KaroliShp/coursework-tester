#!/bin/sh

# Usage: ./cw_tester.sh 0 tokenizer
# Where tokenizer must be the name of the .c, .s and shell script

# 0 - false, > 1 - true
OUTPUT_INDIVIDUAL_RESULTS="$1"
# Name of the task
TASK_NAME="$2"

# Counter for inputs
COUNTER=0

# Color codes for output
RED='\033[0;31m' # Error
NC='\033[0m' # No color
LIGHT_GREEN='\033[1;32m' # Success
PURPLE='\033[0;35m' # MIPS
LIGHT_GRAY='\033[0;37m' # C
WHITE='\033[1;37m' # Script output

printf "\n${WHITE}${TASK_NAME} tester started${NC}\n"

while IFS="" read -r p || [ -n "$p" ]
do
  # Print the test line to the console
  printf "\n${WHITE}Test input ${COUNTER}:${NC} ${p}\n"

  # Write the line to input.txt file
  echo "$p" > "input.txt"

  # Execute both commands
  COMMAND1="$(java -jar Mars4_5.jar nc me sm ${TASK_NAME}.s 2>/dev/null)"
  COMMAND2="$(./${TASK_NAME})"

  if [ "${COMMAND1}" = "${COMMAND2}" ]; then
    printf "${LIGHT_GREEN}SUCCESS: MIPS equal to C${NC}"
  else
    printf "${RED}ERROR: MIPS not equal to C${NC}"
  fi

  # If invididual output is required
  if [ "$OUTPUT_INDIVIDUAL_RESULTS" -ge 1 ];
  then
    # Execute mips code
    printf "\n\n${PURPLE}MIPS output start${NC}\n"
    echo "${COMMAND1}"
    printf "${PURPLE}MIPS output end${NC}\n\n"

    # Execute C code
    printf "${LIGHT_GRAY}C output start${NC}\n"
    echo "${COMMAND2}"
    printf "${LIGHT_GRAY}C output end${NC}\n"
  fi

  # Increase counter by one
  COUNTER=$(( COUNTER + 1))
done < input_all.txt

printf "\n\n${WHITE}${TASK_NAME} tester ended${NC}\n\n"
