module GuessTheNumber;

import std.stdio;
import std.random;
import std.string;
import std.conv; 

void main()
{
    int answerRandom = uniform(1, 50);
    int playerGuess;
    bool guessedCorrectly = false;

    writeln("Guess the number between 1 and 50:");

    while (!guessedCorrectly)
    {
        write("Enter your guess: ");
        playerGuess = to!int(readln().strip());

        if (playerGuess < answerRandom)
        {
            writeln("Too low! Try again.");
        }
        else if (playerGuess > answerRandom)
        {
            writeln("Too high! Try again.");
        }
        else
        {
            writeln("Congratulations! You guessed the correct number.");
            readln();
            guessedCorrectly = true;
        }
    }
}
