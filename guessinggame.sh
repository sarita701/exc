#!/usr/bin/env bash
# File: guessinggame.sh
# A guessing game that asks the user to guess the number of files in the current directory.

# Function to get the number of files in the current directory
get_file_count() {
    echo $(ls -1 | wc -l)
}

# Function to check the user's guess
check_guess() {
    if [[ $1 -lt $2 ]]; then
        echo "Too low! Try again."
    elif [[ $1 -gt $2 ]]; then
        echo "Too high! Try again."
    else
        echo "Congratulations! You guessed correctly."
        return 0
    fi
    return 1
}

# Main program
echo "Welcome to the file guessing game!"
echo "Try to guess how many files are in the current directory."

file_count=$(get_file_count)
guess=0

# Loop until the user guesses correctly
while [[ $guess -ne $file_count ]]; do
    read -p "Enter your guess: " guess

    # Ensure input is a number
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        continue
    fi

    check_guess $guess $file_count
done
