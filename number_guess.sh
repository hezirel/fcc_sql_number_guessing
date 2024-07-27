#!/bin/bash

function run_psql {
  psql --username=freecodecamp --dbname=number_guess -c "$1"
}

RANDOM_NUMBER=$((1 + RANDOM % 1000))

echo "Enter your username:"
read USERNAME

if [ -z "$USERNAME" ]; then
  echo "You must enter a username!"
  exit 1
fi

USER=$(run_psql "SELECT username FROM games WHERE username = '$USERNAME';" | sed -n 3p | awk '{$1=$1;print}')

if [ "$USER" != "$USERNAME" ]; then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
else
    GAMES_PLAYED=$(run_psql "SELECT COUNT(*) FROM games WHERE username = '$USERNAME';" | sed -n 3p | awk '{$1=$1;print}')
    BEST_GAME=$(run_psql "SELECT MIN(guesses) FROM games WHERE username = '$USERNAME';" | sed -n 3p | awk '{$1=$1;print}')
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


echo "Guess the secret number between 1 and 1000:"

GUESSES=0
while true; do
    read GUESS
    if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
        continue
    else
        GUESSES=$((GUESSES + 1))
    fi
    if [ $GUESS -lt $RANDOM_NUMBER ]; then
        echo "It's higher than that, guess again:"
    elif [ $GUESS -gt $RANDOM_NUMBER ]; then
        echo "It's lower than that, guess again:"
    else
        echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
        run_psql "INSERT INTO games (username, guesses) VALUES ('$USERNAME', $GUESSES);" 2>&1 >/dev/null
        exit
    fi
done
