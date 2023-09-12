class Genre < ApplicationRecord
  has_many :genre_movies, dependent: :destroy
  has_many :movies, through: :genre_movies
end
