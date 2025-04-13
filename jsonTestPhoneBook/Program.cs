// See https://aka.ms/new-console-template for more information

using jsonTestPhoneBook;

var manager = new ClJsonManagerContact();
help();
while (true)
{
    string inputUser = Console.ReadLine().ToLower();
    if (inputUser == "add")
    {
        Console.ForegroundColor = ConsoleColor.Green;
        Console.WriteLine("enter firstName");
        string firstName = Console.ReadLine();
        Console.WriteLine("enter lastName");
        string lastName = Console.ReadLine();
        Console.WriteLine("enter number");
        string number = Console.ReadLine();
        Console.ResetColor();
        if (firstName != null && lastName != null && number != null)
        {
            manager.AddData(firstName , lastName , number);
        }
        else
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("Error , Inputs must not be empty.");
            Console.ResetColor();
        }
    }
    else if (inputUser == "show")
    {
        Console.WriteLine("All Contacts");
        manager.ShowData();
    }
    else if (inputUser == "delete")
    {
        Console.WriteLine("To delete a user , you must enter the user name.");
        string inputUserDelete = Console.ReadLine();
        if (inputUserDelete != null)
        {
            manager.DeleteData(inputUserDelete);
        }
        else
        {
            Console.WriteLine("Error , input must not be empty.");
        }

    }
    else if (inputUser == "exit")
    {
        break;
    } else if (inputUser == "help")
    {
        help();
    }
    else
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine("please Enter (add) , (show) , (delete) , (exit) , (help)");
        Console.ResetColor();
    }
}

void help()
{
            Console.ForegroundColor = ConsoleColor.Cyan;
            Console.WriteLine("Aripa Studio , khashayar , Dlang project");
            Console.WriteLine("For Add , you can type : add");
            Console.WriteLine("For Show All , you can type : show"); 
            Console.WriteLine("for delete , you can type : delete ");
            Console.WriteLine("For exit Program , you can type : exit");
            Console.WriteLine("For Help , You can type help");
Console.ResetColor();

}




