module TicTac_Toe;

import std.stdio;
import std.conv;
import std.string;

enum Player
{
    X,
    O
}

char[][] createBoardGame()
{
    return [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']];
}

void printBoardGame(char[][] board)
{
    writeln("___________");
    foreach (row; board)
    {
        write("| ");
        foreach (cell; row) 
        {
            write(cell ~ " | ");
        }
        writeln("\n___________");
    }
}

bool isValidMove(char[][] board, int row, int col)
{
    return row >= 0 && row < 3 && col >= 0 && col < 3 && board[row][col] == ' ';
}

bool checkWin(char[][] board, char player)
{
    // Check rows and columns
    for (int i = 0; i < 3; i++)
    {
        if (board[i][0] == player && board[i][1] == player && board[i][2] == player)
            return true;
        if (board[0][i] == player && board[1][i] == player && board[2][i] == player)
            return true;
    }

    // Check diagonals
    if (board[0][0] == player && board[1][1] == player && board[2][2] == player)
        return true;
    if (board[0][2] == player && board[1][1] == player && board[2][0] == player)
        return true;

    return false;
}

bool isBoardFull(char[][] board)
{
    foreach (row; board)
    {
        foreach (cell; row)
        {
            if (cell == ' ')
                return false;
        }
    }
    return true;
}

int main()
{
    char[][] board = createBoardGame();
    Player currentPlayer = Player.X;

    while (true)
    {
        printBoardGame(board); // چاپ برد قبل از هر حرکت
        writefln("Player %s, enter row (0-2) and column (0-2):", currentPlayer);

        int row, col;
        try
        {
            row = to!int(readln().strip());
            col = to!int(readln().strip());
        }
        catch (Exception e)
        {
            writeln("Invalid input. Please enter numbers between 0 and 2.");
            continue; // بازگشت به ابتدای حلقه برای دریافت ورودی جدید
        }

        if (!isValidMove(board, row, col))
        {
            writeln("Invalid move. Try again.");
            continue; // بازگشت به ابتدای حلقه برای دریافت ورودی جدید
        }

        // به‌روزرسانی برد با حرکت بازیکن
        board[row][col] = currentPlayer == Player.X ? 'X' : 'O';

        // بررسی برنده
        if (checkWin(board, currentPlayer == Player.X ? 'X' : 'O'))
        {
            printBoardGame(board); // چاپ برد نهایی
            writeln("Player ", currentPlayer, " wins!");
            break; // خروج از حلقه
        }

        // بررسی پر بودن برد
        if (isBoardFull(board))
        {
            printBoardGame(board); // چاپ برد نهایی
            writeln("It's a tie!");
            break; // خروج از حلقه
        }

        // تغییر نوبت بازیکن
        currentPlayer = currentPlayer == Player.X ? Player.O : Player.X;
    }

    return 0;
    
}
	


void Arrays()
{
    int[] array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    array[0] = 22;
    writeln(array[3] + array[0]);

}

void Arrays2()
{
    int[][] array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    writeln(array[0][0]);
    writeln(array[1][1]);
    writeln(array[2][2]);
}



