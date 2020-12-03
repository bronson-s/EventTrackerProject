# EventTrackerProject

### Overview
 The project required us to create a database schema with a table of our choosing and some sample data. Students were required to perform all interactions with the database RESTfully using Spring Data JPA framework. All routes were tested using Postman. This project was assigned over the course of multiple weekends, the first being dedicated to building a RESTful api and a relational database with mySQL for the back end. The following week we used html and javascript to dynamically interact with a single page that can  perform C.R.U.D operations.


### Topics
#### Week 1
* Spring Data JPA
* RESTful Services
* Testing routes with Postman
#### Week 2
* Adding scripts to a web application
* Send asynchronous requests to Java controllers with JavaScript's XMLHttpRequest
* Consume and parse JSON responses with JavaScript
* Build HTML with JavaScript
* Send POST/PUT/DELETE requests with XMLHttpRequest
#### Week 3
* Angular
* Node and npm
* typescript
* Angular Command Line Interface
* Directives and Bindings
* Components and Services
* HttpClientModule




### Lessons Learned
This project solidified my knowledge of how to configure a Spring Data JPA framework and interact with a database RESTfully, and also familiarized me with postman. I learned how to perform asynchronous requests in JavaScript and in and in Angular with typescript.

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
