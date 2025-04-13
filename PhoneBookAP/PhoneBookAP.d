module PhoneBookAP;

import std.stdio;
import CLmanagerJson;
import std.string;
import std.file;
import std.json;
import std.conv;
import std.algorithm;
import std.array;

int main()
{
    auto manager = new ClmanagerJsonClass();
    help();
    while(true)
	{
        string inputUser = strip(readln()).toLower();
        if(inputUser == "add")
		{
			writeln("enter firstName : ");
			string inputUserFirstName = readln();
			writeln("enter last Name : ");
			string inputUserLastName = readln();
			writeln("enter Number");
			string inputUsernumber = readln();
			if(inputUserFirstName.empty && inputUserLastName.empty && inputUsernumber.empty)
			{
				writeln("Error , Inputs must not be empty.");
			}else
			{
				manager.AddData(inputUserFirstName , inputUserLastName , inputUsernumber);
			}

		}else if(inputUser == "show")
		{
			writeln("All Contacts:");
			manager.ShowData();
		}else if(inputUser == "delete")
		{
			writeln("To delete a user, you must enter the user name.");
			string inputUserDelete = readln();
			manager.DeleteData(inputUserDelete);
		}else if(inputUser == "exit")
		{
			break;
		}else if(inputUser == "help")
		{
			help();
		}else
		{
            writeln("please Enter (add) , (show) , (delete) , (exit) , (help)");
		}

	}


    
    return 0;
}

void help()
{
    writeln("Aripa Studio , khashayar , Dlang project");
    writeln("For Add , you can type : add");
    writeln("For Show All , you can type : show");
    writeln("for delete , you can type : delete ");
    writeln("For exit Program , you can type : exit");
	writeln("For Help , You can type help");
    
}


