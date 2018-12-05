class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates :movie_id, presence: true
  validates :user_id, presence: true
  validates :rate, presence: true
  validates :comment, presence: true, length: { minimum: 10 }
end



