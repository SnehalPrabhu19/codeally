#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# get username
echo Enter your username:
read USERNAME

# get info from database
NAME=$($PSQL "SELECT name FROM users WHERE name='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING(user_id) WHERE name='$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(guess) FROM users INNER JOIN games USING(user_id) WHERE name='$USERNAME'")

# if first time player, no user
if [[ -z $NAME ]] 
then
echo Welcome, $USERNAME! It looks like this is your first time here.
INSERT_USERNAME=$($PSQL "INSERT INTO users(name) VALUES ('$USERNAME')")
NAME=$($PSQL "SELECT name FROM users WHERE name='$USERNAME'")
else
# welcome back msg
echo Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

echo -e "\nGuess the secret number between 1 and 1000:"

GUESS_COUNT=1
while read USER_GUESS
do
# if not an integer
if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
then
echo That is not an integer, guess again:
else
  # if correct
  if [[ $USER_GUESS -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    # insert into table
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$NAME'")
    INSERT_INTO_GAMES=$($PSQL "INSERT INTO games (user_id,guess) VALUES ($USER_ID,$GUESS_COUNT)")
  exit
  # if lower
  elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
  then
  echo -e "\nIt's higher than that, guess again:"
  # if higher
  elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
  then
  echo -e "It's lower than that, guess again:"
  fi
fi
GUESS_COUNT=$(( $GUESS_COUNT + 1 ))
done