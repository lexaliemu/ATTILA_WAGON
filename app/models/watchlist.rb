class Watchlist < ApplicationRecord
  has_many :movie_watchlists
  belongs_to :user
end
