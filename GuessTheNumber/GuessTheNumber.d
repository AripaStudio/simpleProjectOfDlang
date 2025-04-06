module GuessTheNumber;

import std.stdio;
import std.random;
import std.string;
import std.conv; 

void main()
{
    writeln("Whether the game is from 1 to 50 or 1 to 100
			For one to fifty, write:
			fifty
			And for one to one hundred, write:
			hundred
			And for any number, write:
			any");
	bool inputGame = false;
	while(!inputGame)
	{
		string inputUser = readln().strip;
		if(inputUser == "fifty")
		{
			PlayGameone_to_fifty();
			inputGame = true;
		}else if(inputUser == "hundred")
		{
			PlayGameone_to_hundred();
			inputGame = true;
		}else if(inputUser == "any")
		{
			writeln("Enter the maximum number for the game: ");
			int maxRandom = to!int(readln().strip());
			PlayGameone_to_any(maxRandom);
			inputGame = true;
		}else
		{
			writeln("Invalid input. Please enter 'fifty' or 'hundred' or 'any'.");
		}
	}
	
}

void PlayGameone_to_fifty()
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

void PlayGameone_to_hundred()
{
	int answerRandom = uniform(1, 100);
	int playerGuess;
	bool guessedCorrectly = false;
	writeln("Guess the number between 1 and 100:");
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

void PlayGameone_to_any( int MaxRandom)
{
    int answerRandom = uniform( 1, MaxRandom);
	int playerGuess;
	bool guessedCorrectly = false;
	string maxRandomInt = to!string(MaxRandom);
	writeln("Guess the number between 1 and " ~ maxRandomInt ~ " : ");

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




