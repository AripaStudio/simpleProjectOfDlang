module Calculator;  

import std.stdio;  
import std.conv;  
import std.exception;  
import std.string; 

//a simple Calculator In D
int main()  
{  
   writeln("Simple Calculator in D");  
   string inputOneNumber = strip(readln());  
   string inputTwoNumber = strip(readln());  

   int a;  
   int b;  

   try  
   {  
       a = to!int(inputOneNumber);  
   } catch (ConvException)  
   {  
       writeln("Error: First input is not a valid number");  
       readln();  
       return 1;  
   }  

   try {  
       b = to!int(inputTwoNumber);  
   } catch (ConvException)  
   {  
       writeln("Error: Second input is not a valid number");  
       readln();  
       return 1;  
   }  

   writeln("Addition: ", add(a, b));  
   writeln("Subtraction: ", subtract(a, b));  
   writeln("Multiplication: ", multiply(a, b));  
   writeln("Division: ", divide(a, b));  

   readln();  
   return 0;  
}  

int add(int a, int b) {  
   return a + b;  
}  

int subtract(int a, int b) {  
   return a - b;  
}  

int multiply(int a, int b) {  
   return a * b;  
}  

double divide(int a, int b) {  
   if (b == 0) {  
       writeln("Error: Division by zero");  
       return double.nan;  
   }  
   return cast(double) a / b;  
}
