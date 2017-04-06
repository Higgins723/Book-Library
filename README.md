# Book App

This app is a Rails API and a React frontend. Eventually, there will be a React Native app that uses the rails api.

* Ruby version
  * 2.3.3

* Database creation
  * PostgreSQL (9.4.11)
  * Run `psql` in the terminal
    * Inside of psql run `CREATE DATABASE timeclockapi_development;`
  * Run `rake db:migrate`

## Hitting the API

I use [Postman](https://www.getpostman.com/) to test my API endpoints.

* Running `rails routes` on this project returns:
```
      Prefix Verb   URI Pattern                           Controller#Action
book_authors GET    /books/:book_id/authors(.:format)     authors#index
             POST   /books/:book_id/authors(.:format)     authors#create
 book_author GET    /books/:book_id/authors/:id(.:format) authors#show
             PATCH  /books/:book_id/authors/:id(.:format) authors#update
             PUT    /books/:book_id/authors/:id(.:format) authors#update
             DELETE /books/:book_id/authors/:id(.:format) authors#destroy
       books GET    /books(.:format)                      books#index
             POST   /books(.:format)                      books#create
        book GET    /books/:id(.:format)                  books#show
             PATCH  /books/:id(.:format)                  books#update
             PUT    /books/:id(.:format)                  books#update
             DELETE /books/:id(.:format)                  books#destroy
```
* Let's test those routes (* Make sure Postman and Rails are running):
  * Postman is an app so just find the location and run it
  * To kickoff Rails run `bin/rails s` ("s" is short for server)
  * First we have to create a book or there will be nothing to see
    * Select POST and in the URL paste `localhost:3000/books/`
    * From the Body tab click raw and make sure the drop down option `JSON (application/json)` is selected
    * ```
      {
        "title": "Harry Potter",
        "description": "Harry Potter is a series of fantasy novels"
      }
      ```
      * This will add the book Harry Potter to the database.
      * ```
        {
          "id": 5,
          "title": "Harry Potter",
          "description": "Harry Potter is a series of fantasy novels",
          "created_at": "2017-04-05T23:59:44.162Z",
          "updated_at": "2017-04-05T23:59:44.162Z"
        }
        ```
      * Oops we forgot to add additional information to the Harry Potter title
        * Now, change to PUT and change the url to `localhost:3000/books/5`
        * Notice that 5 is the same id as when we created the book
        * In the body we only need to change the title so it should look like this
        * ```
          {
            "title": "Harry Potter and the Sorcerer's Stone"
          }
          ```
          * This will now have the correct title, you can check it by using GET and using the same url `localhost:3000/books/5`
          * ```
            {
              "id": 5,
              "title": "Harry Potter and the Sorcerer's Stone",
              "description": "Harry Potter is a series of fantasy novels",
              "created_at": "2017-04-05T23:59:44.162Z",
              "updated_at": "2017-04-06T00:21:20.558Z"
            }
            ```
      * Now let's add an author change to POST and change the url to `localhost:3000/books/5/authors`
      * ```
        {
          "name": "J.K. Rowling"
        }
        ```
        * This will return the author, don't forget to change to GET and keep the same url
        * There can be multiple authors for a book which is why we see the author in an array []
          * ```
            [
              {
                "id": 10,
                "name": "J.K. Rowling",
                "book_id": 5,
                "created_at": "2017-04-06T00:32:25.156Z",
                "updated_at": "2017-04-06T00:32:25.156Z"
              }
            ]
            ```
        * If we change the url to `localhost:3000/books/5/authors/10` we will just see
          * ```
            {
              "id": 10,
              "name": "J.K. Rowling",
              "book_id": 5,
              "created_at": "2017-04-06T00:32:25.156Z",
              "updated_at": "2017-04-06T00:32:25.156Z"
            }
            ```
      * The last thing to check is to delete a book and an author
        * Change to DELETE and the url to `localhost:3000/books/5`
          * If you GET for that url you will get
            * ```
              {
                "message": "Couldn't find Book with 'id'=5"
              }
              ```
        * That author will also be gone too

## Adding React to the project