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

OLDIFS=$IFS
IFS=","

# Sort the input file by goals_overall in descending order
sort -t',' -k16,16nr "$1" > sorted.csv

read full_name age birthday birthday_GMT league season position current_club minutes_played_overall minutes_played_home minutes_played_away nationality appearances_overall appearances_home appearances_away goals_overall goals_home goals_away assists_overall assists_home assists_away penalty_goals penalty_misses clean_sheets_overall clean_sheets_home clean_sheets_away conceded_overall conceded_home conceded_away yellow_cards_overall red_cards_overall goals_involved_per_90_overall assists_per_90_overall goals_per_90_overall goals_per_90_home goals_per_90_away min_per_goal_overall conceded_per_90_overall min_per_conceded_overall min_per_match min_per_card_overall min_per_assist_overall cards_per_90_overall rank_in_league_top_attackers rank_in_league_top_midfielders rank_in_league_top_defenders rank_in_club_top_scorer < sorted.csv;

# Open the output file for writing
echo "full_name,nationality,position,goals_overall" > "$2"

#store the maximum goals in goals_overall column in a variable
max_goals=$(awk -F',' 'NR==2 {print $16}' sorted.csv)

#create a do while loop with condition max goals > 0
while [ $max_goals -gt -1 ]; do 

#print the row if the goals scored is equal to max_goals && 7th column is 'Goalkeeper'
awk -F',' -v max_goals="$max_goals" '$16 == max_goals && $7 == "Goalkeeper" {print $1","$12","$7","$16 >> "'"$2"'"}' sorted.csv

#print the row if the goals scored is equal to max_goals && 7th column is 'Defender'
awk -F',' -v max_goals="$max_goals" '$16 == max_goals && $7 == "Defender" {print $1","$12","$7","$16 >> "'"$2"'"}' sorted.csv

#print the row if the goals scored is equal to max_goals && 7th column is 'Midfielder'
awk -F',' -v max_goals="$max_goals" '$16 == max_goals && $7 == "Midfielder" {print $1","$12","$7","$16 >> "'"$2"'"}' sorted.csv

#print the row if the goals scored is equal to max_goals && 7th column is 'Forward'
awk -F',' -v max_goals="$max_goals" '$16 == max_goals && $7 == "Forward" {print $1","$12","$7","$16 >> "'"$2"'"}' sorted.csv

#decrement max_goals by 1
max_goals=$((max_goals-1))

#end the loop
done

# Remove the temporary sorted file
rm sorted.csv
echo "Output file generated successfully."