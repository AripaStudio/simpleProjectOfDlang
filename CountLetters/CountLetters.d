module CountLetters;

import std.stdio;
import std.string;

int main()
{
    writeln("please Enter a Text : \n");
    string InputText = readln();
    InputText = chomp(InputText); 
    
    ulong LetterCount = InputText.length;

    writeln("Latter : " , LetterCount);
    readln();
    return 0;
}
