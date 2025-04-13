using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace jsonTestPhoneBook
{
    public class ClJsonManagerContact
    {

        private const string fileName = "phoneBookCsharpJson.json";
        private List<JsonFileCantact> contacts;

        public ClJsonManagerContact()
        {
            loadData();
        }

        private void loadData()
        {
            if (File.Exists(fileName))
            {
                string jsonString = File.ReadAllText(fileName);
                contacts = JsonSerializer.Deserialize<List<JsonFileCantact>>(jsonString) ?? new List<JsonFileCantact>();
            }
            else
            {
                contacts = new List<JsonFileCantact>();
            }

        }

        private void saveData()
        {
            var options = new JsonSerializerOptions { WriteIndented = true };
            string jsonString = JsonSerializer.Serialize(contacts, options);
            File.WriteAllText(fileName , jsonString);
        }

        public void AddData(string firstName, string lastName, string number)
        {
            var contact = new JsonFileCantact
            {
                FirstName = firstName,
                LastName = lastName,
                Number = number
            };

            contacts.Add(contact);
            saveData();
            Console.WriteLine("Contact added successfully!");
        }

        public void DeleteData(string firstName)
        {
            contacts.RemoveAll(u => u.FirstName == firstName);
            saveData();
            Console.WriteLine("Contact deleted successfully!");
        }

        public void ShowData()
        {
            if (contacts.Count == 0)
            {
                Console.WriteLine("No contacts found!");
                return;
            }

            foreach (var contact in contacts)
            {
                Console.WriteLine($"First Name: {contact.FirstName}");
                Console.WriteLine($"Last Name: {contact.LastName}");
                Console.WriteLine($"Number: {contact.Number}");
                Console.WriteLine("---");
            }
        }


    }

    public class JsonFileCantact
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Number { get; set; }
    }



}