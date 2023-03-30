#!/bin/bash

# Check that two file names were provided as arguments
if [ $# -lt 2 ]; then
    echo "Error: Two file names must be provided as arguments"
    exit 1
fi

# Check if input file exists
if [ ! -f "$1" ]; then
  echo "Error: Input file not found."
  exit 1
fi

# Create or overwrite output file
> "$2"


# Filter and print players with age > 30 and goals_overall >= 1
awk -F',' '$2 > 30 && $16 >= 1 { print }' "$1" >> "$2"

echo "Output file generated successfully."
