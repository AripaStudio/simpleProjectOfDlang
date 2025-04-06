// See https://aka.ms/new-console-template for more information

using System.Runtime.InteropServices;

enum Move
{
    Rock,
    Paper,
    Scissors
}

class program
{
    static void Main()
    {
        Random random = new Random();
        var botMoveInt = random.Next((int)Move.Rock, (int)Move.Scissors + 1);
        var botMove = (Move)botMoveInt;
        Console.WriteLine("Please choose your Move (rock, paper, scissors)");

        string inputPlayer;
        Move PlayerMove;
        while (true)
        {
            inputPlayer = Console.ReadLine();
            if (inputPlayer == null)
            {
                Console.WriteLine("Invalid input. Please try again.");
                continue;
            }
            PlayerMove = StringToMove(inputPlayer);
            break;
        }

        Console.WriteLine($"Player chose: {MoveToString(PlayerMove)}");
        Console.WriteLine($"Bot chose: {MoveToString(botMove)}");

        if (botMove == PlayerMove)
        {
            Console.WriteLine("Equal");
        } else if (PlayerMove == Move.Paper &&  botMove == Move.Rock ||
                   PlayerMove == Move.Scissors  && botMove == Move.Paper ||
                   PlayerMove == Move.Rock && botMove == Move.Scissors)
        {
            Console.WriteLine("You Win");  
        }
        else
        {
            Console.WriteLine("You Lose");
        }
        Console.WriteLine("Press any key to exit...");
        Console.ReadKey();
    }

    public static string MoveToString(Move move)
    {
        switch (move)
        {
            case Move.Rock: return "Rock";
            case Move.Paper: return "Paper";
            case Move.Scissors: return "Scissors";
            default: return "Unknown";
        }
    }

    public static Move StringToMove(string input)
    {
        input = input.Trim().ToLower();
        if (input == "rock")
        {
            return Move.Rock;
        }

        if (input == "paper")
        {
            return Move.Paper;
        }

        if (input == "scissors")
        {
            return Move.Scissors;
        }
        return Move.Rock; // Default Value;
    }
}






