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

# Sort the input file by goals_overall in descending order
sort -t',' -k16,16nr "$1" > sorted.csv

# Initialize count to 0
count=0

#initialize prev_goals to max goals in the file
prev_goals=$(awk -F',' 'NR==2 {print $16}' sorted.csv)

# Open the output file for writing
echo "full_name,age,birthday,birthday_GMT,league,season,position,Current Club,minutes_played_overall,minutes_played_home,minutes_played_away,nationality,appearances_overall,appearances_home,appearances_away,goals_overall,goals_home,goals_away,assists_overall,assists_home,assists_away,penalty_goals,penalty_misses,clean_sheets_overall,clean_sheets_home,clean_sheets_away,conceded_overall,conceded_home,conceded_away,yellow_cards_overall,red_cards_overall,goals_involved_per_90_overall,assists_per_90_overall,goals_per_90_overall,goals_per_90_home,goals_per_90_away,min_per_goal_overall,conceded_per_90_overall,min_per_conceded_overall,min_per_match,min_per_card_overall,min_per_assist_overall,cards_per_90_overall,rank_in_league_top_attackers,rank_in_league_top_midfielders,rank_in_league_top_defenders,rank_in_club_top_scorer." > "$2"

# Read the sorted CSV file line by line
awk -F',' '{
  # If the goals_overall value changes, increment the count
  if (prev_goals != $16) {
    count++
    prev_goals = $16
  }
  
  # Exit the loop if count reaches 10
  if (count == 11) {
    exit
  }

  # Write the current row to the output file
  print $0 >> "'"$2"'"
  
  
}' sorted.csv

# Remove the temporary sorted file
rm sorted.csv

echo "Output file generated successfully."
