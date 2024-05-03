# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
# TODO!

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
#Studios
new_studio = Studio.new
new_studio ["name"] = "Warner Bros."
new_studio.save
#Check data insert
#p new_studio
#puts "There are #{Studio.all.count} studios"

#Variables to link tables
warner = Studio.find_by({"name" => "Warner Bros."})
#Movies
new_movie = Movie.new
new_movie ["title"] = "Batman Begins"
new_movie ["year_released"] = 2005
new_movie ["rated"] = "PG-13"
new_movie ["studio_id"] = warner["id"]
new_movie.save

new_movie = Movie.new
new_movie ["title"] = "The Dark Knight"
new_movie ["year_released"] = 2008
new_movie ["rated"] = "PG-13"
new_movie ["studio_id"] = warner["id"]
new_movie.save

new_movie = Movie.new
new_movie ["title"] = "The Dark Knight Rises"
new_movie ["year_released"] = 2012
new_movie ["rated"] = "PG-13"
new_movie ["studio_id"] = warner["id"]
new_movie.save

#Check data insert
#p new_movie
#puts "There are #{Movie.all.count} movies"

#Actors
new_actor = Actor.new
new_actor ["name"] = "Christian Bale"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Michael Caine"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Liam Neeson"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Katie Holmes"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Gary Oldman"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Heath Ledger"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Aaron Eckhart"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Maggie Gyllenhaal"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Tom Hardy"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Joseph Gordon-Levitt"
new_actor.save

new_actor = Actor.new
new_actor ["name"] = "Anne Hathaway"
new_actor.save

#Check data insert
#p new_actor
#puts "There are #{Actor.all.count} actors"

#Variables to link tables
movie_Batman1 = Movie.find_by({"title" => "Batman Begins"})
movie_Batman2 = Movie.find_by({"title" => "The Dark Knight"})
movie_Batman3 = Movie.find_by({"title" => "The Dark Knight Rises"})

actor_CBale = Actor.find_by({"name" => "Christian Bale"})
actor_MCaine = Actor.find_by({"name" => "Michael Caine"})
actor_LNeeson = Actor.find_by({"name" => "Liam Neeson"})
actor_KHolmes = Actor.find_by({"name" => "Katie Holmes"})
actor_GOldman = Actor.find_by({"name" => "Gary Oldman"})
actor_HLedger = Actor.find_by({"name" => "Heath Ledger"})
actor_AEckhart = Actor.find_by({"name" => "Aaron Eckhart"})
actor_MGyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
actor_THardy = Actor.find_by({"name" => "Tom Hardy"})
actor_JGordon = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
actor_AHathaway = Actor.find_by({"name" => "Anne Hathaway"})
#Roles
#Batman Begins
new_role = Role.new
new_role ["movie_id"] = movie_Batman1["id"]
new_role ["actor_id"] = actor_CBale["id"]
new_role ["character_name"] = "Bruce Wayne"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman1["id"]
new_role ["actor_id"] = actor_MCaine["id"]
new_role ["character_name"] = "Alfred"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman1["id"]
new_role ["actor_id"] = actor_LNeeson["id"]
new_role ["character_name"] = "Ra's Al Ghul"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman1["id"]
new_role ["actor_id"] = actor_KHolmes["id"]
new_role ["character_name"] = "Rachel Dawes"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman1["id"]
new_role ["actor_id"] = actor_GOldman["id"]
new_role ["character_name"] = "Commissioner Gordon"    
new_role.save

#The Dark Knight
new_role = Role.new
new_role ["movie_id"] = movie_Batman2["id"]
new_role ["actor_id"] = actor_CBale["id"]
new_role ["character_name"] = "Bruce Wayne"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman2["id"]
new_role ["actor_id"] = actor_HLedger["id"]
new_role ["character_name"] = "Joker"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman2["id"]
new_role ["actor_id"] = actor_AEckhart["id"]
new_role ["character_name"] = "Harvey Dent"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman2["id"]
new_role ["actor_id"] = actor_MCaine["id"]
new_role ["character_name"] = "Alfred"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman2["id"]
new_role ["actor_id"] = actor_MGyllenhaal["id"]
new_role ["character_name"] = "Rachel Dawes"    
new_role.save

#The Dark Knight Rises
new_role = Role.new
new_role ["movie_id"] = movie_Batman3["id"]
new_role ["actor_id"] = actor_CBale["id"]
new_role ["character_name"] = "Bruce Wayne"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman3["id"]
new_role ["actor_id"] = actor_GOldman["id"]
new_role ["character_name"] = "Commissioner Gordon"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman3["id"]
new_role ["actor_id"] = actor_THardy["id"]
new_role ["character_name"] = "Bane"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman3["id"]
new_role ["actor_id"] = actor_JGordon["id"]
new_role ["character_name"] = "John Blake"    
new_role.save

new_role = Role.new
new_role ["movie_id"] = movie_Batman3["id"]
new_role ["actor_id"] = actor_AHathaway["id"]
new_role ["character_name"] = "Selina Kyle"    
new_role.save

#Check data insert
#p new_role
#puts "There are #{Role.all.count} roles"

# TODO!

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
warner_movies = Movie.where({"studio_id" => warner["id"]})
for movie in warner_movies
    title = movie["title"].ljust(25)
    year = movie["year_released"]
    rated = movie["rated"].ljust(10)
    studio = warner["name"].ljust(10)
    puts "#{title} #{year}    #{rated} #{studio}"
end
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
cast_1 = Role.where({"movie_id" => movie_Batman1["id"]})
for cast in cast_1
    title = movie_Batman1["title"].ljust(30)
    actor_movie = Actor.find_by({"id" => cast["actor_id"]})
    actor_name = actor_movie["name"].ljust(30)
    character = cast["character_name"].ljust(30)
    puts "#{title} #{actor_name} #{character}"
end

cast_2 = Role.where({"movie_id" => movie_Batman2["id"]})
for cast in cast_2
    title = movie_Batman2["title"].ljust(30)
    actor_movie = Actor.find_by({"id" => cast["actor_id"]})
    actor_name = actor_movie["name"].ljust(30)
    character = cast["character_name"].ljust(30)
    puts "#{title} #{actor_name} #{character}"
end

cast_3 = Role.where({"movie_id" => movie_Batman3["id"]})
for cast in cast_3
    title = movie_Batman3["title"].ljust(30)
    actor_movie = Actor.find_by({"id" => cast["actor_id"]})
    actor_name = actor_movie["name"].ljust(30)
    character = cast["character_name"].ljust(30)
    puts "#{title} #{actor_name} #{character}"
end

# TODO!
