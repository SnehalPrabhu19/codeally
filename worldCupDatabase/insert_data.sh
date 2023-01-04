#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE games,teams")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WIN_GOALS OPP_GOALS
do
if [[ $YEAR != "year" ]]
then
# get team_id
WIN_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
OPP_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
# if not found
if [[ -z $WIN_TEAM_ID ]]
  then
  # insert
  INSERT_WIN_TEAM=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
  if [[ $INSERT_WIN_TEAM = "INSERT 0 1" ]]
    then
    echo Inserted into team, $WINNER
  fi
  # get new team id
  WIN_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
fi
# if not found
if [[ -z $OPP_TEAM_ID ]]
  then
  # insert
  INSERT_OPP_TEAM=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
  if [[ $INSERT_OPP_TEAM = "INSERT 0 1" ]]
    then
    echo Inserted into team, $OPPONENT
  fi
  # get new team id
  OPP_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
fi
# games table
INSERT_INTO_GAME=$($PSQL "INSERT INTO games (year,round,winner_goals,opponent_goals,winner_id,opponent_id) VALUES($YEAR,'$ROUND',$WIN_GOALS,$OPP_GOALS,$WIN_TEAM_ID,$OPP_TEAM_ID)")

fi
done