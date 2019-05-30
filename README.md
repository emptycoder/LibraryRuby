# LibraryRuby
Courses ruby.

* Entities:
- Author Name - required, String, not empty
- Biography - optional
* Book
- Title - required,  String, not empty
- Author  - required, must be an instance of Author class.
* Reader
- Name, required, String, not empty
- Email - required, String, not empty
- City - required, String, not empty
- Street - required, String, not empty
- House - required, Integer, positive
* Order 
- Book - required, must be an instance of Book class.
- Reader must be an instance of Reader class
- Date must be an instance of a Ruby Date class. The default date is today's date. 
* Tasks:
- All the data of the library can be to stored/loaded into some storage (YML, JSON etc
- When we instantiate Library Class, all the entities must be loaded from the file.
- The library must have the ability for the next statistics:
- Top Reader. A top reader is the one that takes the most number of 
books. The quantity of returned top readers must be configurable. Default quantity is  1 reader.
- Most Popular Books. The most popular book is the book that was taken by READERS the most times. The quantity of returned most popular books must be configurable. Default quantity is 1 book.
- Number of Readers of the Most Popular Books. The number of readers that take one of the SOME_QUANTITY most popular books. By default, SOME_QUANTITY is 3
P.S. If a user takes, for example, both first most popular book and second most popular book, then we count him one time.
The library must contain “seed” (root) file where you show how you use your library. The root file must contain: 
* Library instantiation
- Creating of all basic Entities in several examples
- Adding at least one example of each entity to Library instance
- Call of the “store/save” method
- Call of all 3 statistics methods.
* Code requirements:
- Project must contain Gemfile/Gemfile.lock with installed Rubocop and Fasterer. Ideally, the project has zero number of error/warnings after lintering.
- Project must have a  hierarchy. Don't put all files in the root of the project. 
- Intentations and “pretty” view of a code
- Project must have Pull Request on Git repository opened
- All branches/commits/modules/classes/methods/variables/files should be named correctly
