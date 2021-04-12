class Movie < ApplicationRecord
  belongs_to :studio

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def self.correct_actors
    joins(movies: { movie_actors: :actor }).where(currently_working: true).order(age: :DESC).distinct
  end
end
