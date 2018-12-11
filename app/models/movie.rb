class Movie < ApplicationRecord
  include CloudinaryHelper
  include AlgoliaSearch
  algoliasearch do
    attribute :title, :actors, :director, :rating, :id
    add_attribute :poster_url
    searchableAttributes [:title, :actors, :director, :poster_url]
    attributesToRetrieve [:title, :actors, :director, :poster_url, :rating, :id]
  end

  def poster_url
    cloudinary_url(poster, width: 400, height: 500, crop: :fill)
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
  monetize :price_cents
  mount_uploader :poster, PosterUploader
end
