class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include CloudinaryHelper
  include AlgoliaSearch

  algoliasearch do
    attribute :first_name, :last_name, :username, :id
    add_attribute :avatar_url
    searchableAttributes [:first_name, :last_name, :username]
    attributesToRetrieve [:first_name, :last_name, :username, :avatar_url, :id]
  end

  def avatar_url
    cloudinary_url(avatar, width: 250, height: 250, crop: :fill)
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :followed_playlists
  has_many :playlists, through: :followed_playlists
  has_many :created_playlists, foreign_key: :user_id, class_name: 'Playlist'
  has_many :reviews
  has_many :watchlist_items
  has_many :watchlist, through: :watchlist_items, source: :movie
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
  mount_uploader :avatar, PosterUploader
  # validates :username, presence: true, uniqueness: true
  # validates :first_name, length: { minimum: 2 }
  # validates :last_name, length: { minimum: 2 }
end
