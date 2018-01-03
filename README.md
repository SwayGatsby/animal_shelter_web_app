# Animal Shelter Web App

![Alt text](https://i.imgur.com/Fhwz2HU.jpg "Screenshot of app")

## Summary

A ruby project created over 5 days as part of CodeClan's 16 week development course. The brief was as follows: 

"The Animal Shelter accepts orphaned or stray animals and takes care of them until they can be adopted by a new owner. The shelter has a list of potential new owners for the animals. Animals may take a while to be trained up and made healthy before being available for adoption.
They are looking for a management system to keep track of their animals and owners.

Must:

-list of all their animals and their admission date


-mark an animal as being adoptable/not adoptable


-assign an animal to a new owner


-list all the owners and their adopted animals"


### Prerequisites

`Ruby (v. 2.4.1 used)`

Gems:
```
sinatra
sinatra-contrib
pg
```


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes:

Navigate to the appropriate folder in your terminal window and git clone the project

Create a PostgreSQL database named animal_shelter 
`psql`
`createdb animal_shelter;`

Create the required database tables by running the animal_shelter.sql file
`psql -d animal_shelter -f db/animal_shelter.sql`

Seed the database by running the seeds.rb file
`ruby db/seeds.rb`

Run the app.rb file to start the server
`ruby app.rb`

Open your browser of choice and go to localhost:4567



## Built With

* [Sinatra](http://sinatrarb.com/documentation.html) - web framework 
* [PostGreSQL](https://www.postgresql.org/docs/) - database system



