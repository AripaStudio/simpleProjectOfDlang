module RandomGenerator;

import std.stdio;                          
import RandomClass.Random; // Import  Random class


int main()
{
    Random randomGen = new Random(12345);

    //10 random number :
    for (int i = 0; i < 10 ; i++)
	{
        writeln(randomGen.next());
	}

    //// 10 random numbers in range (1, 100):

    for (int i = 0; i < 10 ; i++)
	{
        writeln(randomGen.nextInRange(1,10));
	}

    readln();
    return 0;
}
