module CLmanagerJson;

import std.stdio;
import std.file;
import std.json;
import std.conv;
import std.algorithm;
import std.array;

class JsonDataFileManager
{
	public string FirstName;
	public string LastName;
	public string number;



		//تبدیل شی به جیسون 
		JSONValue toJson()
		{

		return JSONValue([
		"FirstName" : JSONValue(FirstName),
		"LastName" : JSONValue(LastName),
		"Number" : JSONValue(number)
		]);


		}


		//تبدیل جیسون به شی
		static JsonDataFileManager fromJson(JSONValue json )
		{
			auto result = new JsonDataFileManager();
			result.FirstName = json["FirstName"].str;
			result.LastName = json["LastName"].str;
			result.number = json["Number"].str;
			return result;
		}

}


public class ClmanagerJsonClass
{
	private string fileName = "JsonPhoneBook.json";
	private JsonDataFileManager[] contacts;

	this()
	{
		loadData();
	}


	private void loadData() 
	{
		if(exists(fileName))
		{
			string jsonString = readText(fileName);
			JSONValue json = parseJSON(jsonString);
			contacts  = json.array.map!(j => JsonDataFileManager.fromJson(j)).array;
		}else
		{
			contacts = [];
		}

	}

	private void saveData()
	{
		JSONValue json = JSONValue(contacts.map!(c => c.toJson()).array);
		write(fileName , json.toPrettyString());
	}


	void AddData(string fristName , string lastName , string number)
	{
		auto contact = new JsonDataFileManager();
		contact.FirstName = fristName;
		contact.LastName = lastName ;
		contact.number = number;
		contacts ~= contact;
		saveData();
		writeln("Contact added successfully");
	}

	void DeleteData(string firstName)
	{
		contacts = contacts.filter!(c => c.FirstName != firstName).array;
		saveData();
		writeln("Contact deleted successfully!");
	}

	void ShowData()
	{
		if(contacts.empty)
		{
			writeln("No contacts found!");
            return;
		}

		foreach(contact; contacts)
		{
			writeln("First Name: ", contact.FirstName);
            writeln("Last Name: ", contact.LastName);
            writeln("Number: ", contact.number);
            writeln("---");
		}
	}

}




