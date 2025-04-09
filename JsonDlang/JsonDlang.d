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
        return [
		"Name" : Name,
        "number" : number,
        "skills": skills.map!(s => JSONValue(s)).array
		];

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

int main()
{  
    string filePath = "JsonDataFile.json";
    
    auto data = new JsonDataFile();
    data.Name = "khashayar";
    data.number = "123";
    data.skills = ["Dlang" , "Csharp"];

    File(filePath , "w").write(data.toJson().toString);

    auto JsonStringRead = readText(filePath);
    JSONValue json = parseJSON(JsonStringRead);
    auto loadedData = JsonDataFile.fromJson(json);

    writeln("Name : " , loadedData.Name);
    writeln("Number : " , loadedData.number);
    writeln("Skills : " , loadedData.skills);


    void callaripa()
	{
        auto aripa = new JsonAripa();
        aripa.MainClass();
	}
    readln();
    return 0;
}
