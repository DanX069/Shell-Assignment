#!/bin/bash

# Check that two file names were provided as arguments
if [ $# -lt 2 ]; then
    echo "Error: Two file names must be provided as arguments"
    exit 1
fi

# Check that the input files exist
if [ ! -f "$1" ]; then
    echo "Error: File $1 not found"
    exit 1
fi

if [ ! -f "$2" ]; then
    echo "Error: File $2 not found"
    exit 1
fi

# Initialize array to store common lines
declare -a common_lines

# Parse each line in file1 and match with lines in file2
while read line1; do
    # Ignore empty lines
    if [[ -n "$line1" ]]; then
        # Initialize file2 to beginning of file for each line of file1
        exec 3< "$2"

        while read -u 3 line2; do
            # Ignore empty lines
            if [[ -n "$line2" ]]; then
                if [[ "$line1" == "$line2" ]]; then
                    common_lines+=("$line1")
                    break
                fi
            fi
        done
    fi
done < "$1"

# Print the common lines to the terminal
if [ ${#common_lines[@]} -eq 0 ]; then
    echo "No common lines found"
else
    printf '%s\n' "${common_lines[@]}"
fi
