module TicTac_Toe;

import std.stdio;

int main()
{
    Arrays();
    Arrays2();
    readln();
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

