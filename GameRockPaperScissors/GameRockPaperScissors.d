module GameRockPaperScissors;

import std.stdio;
import std.random;

string Rock = "Rock";
string Paper = "Paper";
string Scissors = "Scissors";
string ChoiseBot ;
string StatusGame; 
string StatusError = null;
string StatusErrorInputPlayer = null;

int main()
{
	ChoiseRoBot();
	writeln("Please choose your move (rock, paper, scissors)");
	string inputPlayer = readln();
	CoreGame(inputPlayer);
	writeln(StatusGame);
	if(StatusError != null  )
	{
		writeln(StatusError);
	}
	if( StatusErrorInputPlayer != null)
	{
		writeln(StatusErrorInputPlayer);
	}
    readln();
    return 0;
}

void ChoiseRoBot()
{
    int inputRandom = uniform!"[]"(1 , 3);
    if(inputRandom == 1)
	{
		StatusError = null;
        ChoiseBot = Rock;
	}else if(inputRandom == 2)
	{
        ChoiseBot = Paper;
		StatusError = null;

	}else if(inputRandom == 3)
	{
		ChoiseBot = Scissors;
		StatusError = null;
	}else
	{
		StatusError = "Error Bot";
	}
    
}

void CoreGame(string MovePlayer )
{
	string Win = "Shoma Barande Shodid";
	string Lose = "Shoma Bakhtid";
	string Equal = "Shoma Barabar Shodid";
	if(ChoiseBot == Rock)//سنگ
	{
		StatusErrorInputPlayer = null;
		
		if(MovePlayer == Rock)
		{
			StatusGame = Equal;
		}else if (MovePlayer == Paper)
		{
			StatusGame = Win;	
		}else if(MovePlayer == Scissors)
		{
			StatusGame = Lose;		
		}
	}else if(ChoiseBot ==  Paper)//کاغذ
	{
		StatusErrorInputPlayer = null;
		if(MovePlayer == Rock)
		{
			StatusGame = Lose;			
		}else if (MovePlayer == Paper)
		{
			StatusGame = Equal;		
		}else if(MovePlayer == Scissors)
		{
			StatusGame = Win;			
		}
	}else if(ChoiseBot == Scissors)// قیچی
	{
		StatusErrorInputPlayer = null;
		if(MovePlayer == Rock)
		{
			StatusGame = Win;
		}else if (MovePlayer == Paper)
		{
			StatusGame = Lose;		
		}else if(MovePlayer == Scissors)
		{
			StatusGame = Equal;			
		}
	}else
	{
		StatusErrorInputPlayer = "Vorodi Shoma Eshtebah Ast";
		
	}
		 
}







