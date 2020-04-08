#Gym App

##Starting instructions.
psql -d gym_app -f gym.sql
ruby db/seeds.rb
ruby app.rb
http://localhost:4567

##brief.
A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

MVP
The app should allow the gym to create and edit Members
The app should allow the gym to create and edit Classes
The app should allow the gym to book members on specific classes
The app should show a list of all upcoming classes
The app should show all members that are booked in for a particular class

##Built Using.
psql
ruby
sinatra
