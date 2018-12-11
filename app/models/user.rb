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

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  has_many :orders

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end
end
