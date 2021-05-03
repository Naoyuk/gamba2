# Gamba

---

Gamba is a micropost service like Instagram specialized rock climbing.  
For now, you can choose a route from database only Squamish bouldering.  
I'm planning to update areas and another type of climbing routes like sport climbing, trad climbing and multi pich climbing.

---

## This application's features

* post your picture/movie
* add a route
* add your result
* add a caption
* follow another user
* add favorite to another user's posts
* comment to another user's posts


## How to setup Gamba2

```
$ docker-compose build
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
$ docker-compose run web rails db:seed
$ docker-compose up
``````




## Development Environment

* Ruby 2.5.1
* Use Rspec for tests
* Need ImageMagick
