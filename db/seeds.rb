# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

file = URI.parse('https://gist.githubusercontent.com/alexandremeunier/49533eebe2ec93b14d32b2333272f9f8/raw/924d89e2236ca6fa2ade7481c91bfbf858c49531/movies.json').open
json = JSON.parse(file.read)

Movie.destroy_all
Actor.destroy_all
AlternativeTitle.destroy_all
Genre.destroy_all
GenreMovie.destroy_all
MovieActor.destroy_all
total = 0
json.each do |hash|
  new_movie = Movie.create(title: hash['title'], year: hash['year'], image: hash['image'],
                           color: hash['color'], score: hash['score'], rating: hash['rating'])
  hash['alternative_titles'].each do |title|
    AlternativeTitle.create!(alt_title: title, movie: new_movie)
  end
  i = 0
  hash['actors'].each do |actor|
    Actor.create!(fullname: actor, avatar: hash['actor_facets'][i]) unless Actor.find_by(fullname: actor)
    MovieActor.create!(movie: new_movie, actor: Actor.find_by(fullname: actor))
    i += 1
  end
  hash['genre'].each do |genre|
    Genre.create!(category: genre) unless Genre.find_by(category: genre)
    GenreMovie.create!(genre: Genre.find_by(category: genre), movie: new_movie)
  end
  total += 1
  puts "total = #{total}\n\n"
end
