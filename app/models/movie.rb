class Movie < ApplicationRecord
  has_many :genre_movies, dependent: :destroy
  has_many :genres, through: :genre_movies
  has_many :alternative_titles, dependent: :destroy
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors
end
