module GameRockPaperScissors;

import std.stdio;
import std.random;
import std.string;

enum Move {Rock , Paper , Scissors}

string MoveToString(Move move)
{
	switch(move)
	{
		case Move.Rock: return "Rock";
		case Move.Paper: return "Paper";
		case Move.Scissors: return "Scissors";
		default: return "Unknown";
	}
}

Move stringToMove(string input)
{
	input = input.strip().toLower();
	if (input == "rock") return Move.Rock;
	if (input == "paper") return Move.Paper;
	if (input == "Scissors") return Move.Scissors;
	return Move.Rock; //(Default) If botMessage == error

}

int main()
{
	auto botMove = uniform!(Move)(Move.Rock , Move.Scissors + 1);
	writeln("Please choose your move (rock, paper, scissors)");

	string inputPlayer;
	Move playerMove;

	while(true)
	{
		inputPlayer = readln();
		playerMove = stringToMove(inputPlayer);
		if(playerMove != Move.Rock || inputPlayer.strip().toLower == "rock" ||inputPlayer.strip().toLower == "paper" ||inputPlayer.strip().toLower == "scissors"  )
		{
			break;
		}
		writeln("Invalid input. Please enter rock, paper, or scissors.");
	}

	 writeln("Bot chose: ", moveToString(botMove));

	if(botMove  == playerMove)
	{
		writeln("Equal");
	}else if((botMove == Move.Rock && playerMove == Move.Paper) || 
			 (botMove == Move.Paper && playerMove == Move.Scissors ) ||
			 (botMove == Move.Scissors && playerMove == Move.Rock))
	{
		writeln("You Win");
	}else
	{
		writeln("you Lose");
	}
    readln();
    return 0;
}




