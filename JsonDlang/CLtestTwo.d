module CLtestTwo;

import std.stdio;
import std.file;
import std.json;
import std.conv : to;
import std.algorithm;
import std.array;


public class JsonAripa
{
	public void MainClass()
	{
		string Data = `{" "lang": "Persian" , "NameStudio": "AripaStudio" "}`;
		JSONValue j = parseJSON(Data);

		writeln(j["lang"].str);
		writeln(j["NameStudio"].str);


	}

	

}