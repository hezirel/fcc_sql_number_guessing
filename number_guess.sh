#!/bin/bash

function run_psql {
  psql --username=freecodecamp --dbname=number_guess -c "$1"
}

RANDOM_NUMBER=$((1 + RANDOM % 1000))

