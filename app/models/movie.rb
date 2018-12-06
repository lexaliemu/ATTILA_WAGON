class Movie < ApplicationRecord
  include AlgoliaSearch
  algoliasearch do
    attribute :title, :actors, :director, :id
    add_attribute :poster_url
    add_attribute :test_movie
    searchableAttributes [:title, :actors, :director, :poster_url]
    attributesToRetrieve [:title, :actors, :director, :poster_url, :id]
  end

  def poster_url
    poster.url
  end

  def test_movie
    title.upcase
  end

  has_many :movie_categories, dependent: :destroy
  has_many :categories, through: :movie_categories
  has_many :movie_playlists
  has_many :playlists, through: :movie_playlists
  has_many :reviews
  validates :title, presence: true, uniqueness: true
  validates :director, presence: true
  validates :release_date, presence: true
  validates :duration, presence: true
  validates :syllabus, length: { minimum: 10 }
  validates :price, presence: true
  mount_uploader :poster, PosterUploader
end
