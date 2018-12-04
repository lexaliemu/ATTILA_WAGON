class Playlist < ApplicationRecord
  belongs_to :user
  has_many :movie_playlists
  has_many :movies, through: :movie_playlists
  has_many :followed_playlists
  has_many :users, through: :followed_playlists
  validates :name, presence: true
  validates :description, length: { minimum: 10 }
  validates :user_id, presence: true
end


