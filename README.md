# EventTrackerProject

### Overview
Students were asked to create the back end of a web application to be used again at a later date. The project required us to create a database schema with a table of our choosing and some sample data. Furthermore students were required to perform all interactions with the database RESTfully using Spring Data JPA framework. All routes were tested using Postman.



### Topics
* Spring Data JPA
* RESTful Services
* Postman
* AWS

### Lessons Learned
This project solidified my knowledge of how to configure a Spring Data JPA framework and interact with a database RESTfully.

### How to Run
Direct your browser to http://3.20.48.96:8080/BookTracker
and append one of the the get routes listed below.

### Expected Routes
| Return Type   | Route                 | Functionality                  |
|---------------|-----------------------|--------------------------------|
| `List<Book>`  |`GET api/books`        | Gets all books                 |
| `Book`        |`GET api/books/{id}`   | Gets one book by id            |
| `Book`        |`POST api/books`       | Create a new book              |
| `Book`        |`PUT api/books/{id}`   | Updates an existing book by id |
| `void`        |`DELETE api/books/{id}`| Deletes an existing book by id |
