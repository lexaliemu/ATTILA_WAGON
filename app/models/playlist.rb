class Playlist < ApplicationRecord
  include AlgoliaSearch
  include CloudinaryHelper

  algoliasearch do
    attribute :name, :id
    add_attribute :picture_url
    add_attribute :creation_date
    add_attribute :nb_followers
    searchableAttributes [:name]
    attributesToRetrieve [:name, :picture_url, :creation_date, :nb_followers, :id]
  end

  def picture_url
    cloudinary_url(picture, width: 200, height: 300, crop: :fill)
  end

  def creation_date
    "#{created_at.strftime('%d')} #{created_at.strftime('%B')} #{created_at.strftime('%Y')}"
  end

  def nb_followers
    followed_playlists.count
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


