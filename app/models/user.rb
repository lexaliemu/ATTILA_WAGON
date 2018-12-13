class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include CloudinaryHelper
  include AlgoliaSearch

  algoliasearch do
    attribute :first_name, :last_name, :username, :id
    add_attribute :avatar_url
    add_attribute :member_date
    add_attribute :nb_followers
    searchableAttributes [:first_name, :last_name, :username]
    attributesToRetrieve [:first_name, :last_name, :username, :avatar_url, :nb_followers, :member_date, :id]
  end

  def avatar_url
    cloudinary_url(avatar, width: 250, height: 250, crop: :fill)
  end

  def member_date
    "#{created_at.strftime('%B')} #{created_at.strftime('%Y')}"
  end

  def nb_followers
    followers.count
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
    follow   = following_relationships.create(following_id: user_id)
    activity = follow.activities.last

    followers.each do |follower|
      ActionCable.server.broadcast("stories_#{follower.id}", {
        message_partial: ApplicationController.renderer.render(
          partial: "shared/story",
          locals: { activity: activity }
        )
      })
    end
    User.reindex
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
    User.reindex
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end

  def inwatchlist?(movie)
    watchlist = self.watchlist_items
    movies = watchlist.map { |x| x.movie }
    movies.include?(movie)
  end
end
