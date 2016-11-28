# README

pair*Booked* is an application tailored for students in Phase 0 of Dev Bootcamp to find fellow students to pair program with.
A slightly older but fully functional version of the app can be found at http://pairbooked.herokuapp.com.

Environment setup:

* pair*Booked* is written in Ruby on Rails 5. Make sure you have Rails 5 installed on your server along with Bundler version 1.13.5.

* In order to run on Heroku servers, pair*Booked* uses a postgresql database. Make sure you have a compatible postgresql server running. For set up tips, see this tutorial: https://community.c9.io/t/setting-up-postgresql/1573

* pair*Booked* uses the Github api to authenticate users. In order to run this program, you will need to generate a primary key and secret here: https://github.com/settings/tokens/new
 In a new .env file in the pairBooked foler, write:
    GITHUB_KEY=-your oauth token-
    GITHUB_SECRET=-your oauth secret-

* Initialize the databases with the following commands in the terminal:
  bundle exec rake db:create
  bundle exec rake db:migrate
  bundle exec rake db:migrate RAILS_ENV=test
  bundle exec rake db:seed

* To run the test suite, run 
  bundle exec rspec


Notes:
* This app is responsive. Try it on your phone - it looks even better.
* You cannot view your own pairing timeslots in the timeslot index. If you want to see your timeslots, go to the user dashboard.
