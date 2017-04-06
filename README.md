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