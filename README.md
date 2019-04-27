## ASKME

### Description
This is training App social networking. You with your friends can create an account and ask questions. Also anonimus questions are possible.

reCAPTCHA is used against spam.

With the help of hashtags it is possible to search for the right questions.

Implemented in Ruby 2.5.3, Rails 5.2.2

Database development: SQLite3, production: PostgreSQL

App language: russian

### To Launch

1: Download or clone repository

2: Use bundler
```
$ bundle install
```
3: Create DataBase
```
$ bundle exec rails db:create
```
4: Run DataBase migrations
```
$ bundle exec rails db:migrate
```
5: To populate database with seed data run
```
$ bundle exec rails db:seed
```
6: To start Rails service, enter in command line
```
$ rails s
```

### Deploy
The App designed to work with Heroku.

