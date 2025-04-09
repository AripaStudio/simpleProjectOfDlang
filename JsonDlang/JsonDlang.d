module JsonDlang;

import std.stdio;
import std.file;
import std.json;
import std.conv;
import std.algorithm;
import std.array;
import CLtestTwo;



public class JsonDataFile
{
    public string Name ;

    public string number ;

    public string[] skills ;
    
    

    JSONValue toJson() 
	{
        auto jsonSkills = skills.map!(s => JSONValue(s)).array;

        return  JSONValue([
			"Name" : JSONValue(Name),
			"number" : JSONValue(number),
			"skills": JSONValue(jsonSkills)
		]);

	}

    static JsonDataFile fromJson(JSONValue json)
	{
        auto result = new JsonDataFile();
        result.Name = json["Name"].str;
        result.number = json["number"].str;
        result.skills = json["skills"].array.map!(a => a.str).array;
        return result;
	}



}

public string filePath = "JsonDataFile.json";
public int ErrorJsonTest = 0;

void JsonTest()
{
	auto data = new JsonDataFile();
    data.Name = "khashayar";
    data.number = "123";
    data.skills = ["Dlang" , "Csharp"];

    File(filePath , "w").write(data.toJson().toString);

    string JsonStringRead ;
    try 
	{
        JsonStringRead = readText(filePath);
	}catch (Exception e)
	{
		writeln("Error reading file: ", e.msg);
		ErrorJsonTest = 1;
	}

    JSONValue json = parseJSON(JsonStringRead);
    auto loadedData = JsonDataFile.fromJson(json);

    writeln("Name : " , loadedData.Name);
    writeln("Number : " , loadedData.number);
    writeln("Skills : " , loadedData.skills);


}

int main()
{  
    
    
    JsonTest();
    if(ErrorJsonTest == 1)
	{
        return 1;
	}
    void callaripa()
	{
        auto aripa = new JsonAripa();
        aripa.MainClass();
	}
    readln();
    return 0;
}


