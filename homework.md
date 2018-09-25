
Create a database table Ruby class for tracking bounties for Space Cowboys.

An entry in the bounty table must have 4 of these properties: (pick whichever ones you like best!)

name
species
bounty value
danger level (low, medium, high, etc.)

last known location
homeworld
favourite weapon
cashed_in
collected_by

Getting Started Checklist

√ Set up your directory structure

√ Create console.rb which will be used to create some new objects and practice your methods as required (use this as you are writing the class & methods to test them)

√ Create a Ruby file for your Bounty class

√ Write your class definition in the file - initialize, attr_readers, instance variables

√ Make the database - createdb in command line

√ Make a .sql file and write some SQL to create your database table

√ Run the .sql file to set up the table (psql -d data_base_name -f ./path/to/file_name.sql)

√ Implement save,
√ self.delete_all,
√ self.all and
√ update methods on your class - Remember to test them out in console.rb as you go along

Extensions:

√ Implement a self.find method that returns one instance of your class when an id is passed in.

Implement a delete method on an instance, to delete only that one row from the database. (Mixture of update and delete_all)
