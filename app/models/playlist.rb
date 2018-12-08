class Playlist < ApplicationRecord
  include AlgoliaSearch
  include CloudinaryHelper

  algoliasearch do
    attribute :name, :id
    add_attribute :picture_url
    searchableAttributes [:id]
    attributesToRetrieve [:name, :picture_url, :id]
  end

  def picture_url
    cloudinary_url(picture, width: 280, height: 280, crop: :fill)
  end

  belongs_to :user
  has_many :movie_playlists
  has_many :movies, through: :movie_playlists
  has_many :followed_playlists
  has_many :users, through: :followed_playlists
  validates :name, presence: true
  validates :description, length: { minimum: 10 }
  validates :user_id, presence: true
  mount_uploader :picture, PosterUploader
end


