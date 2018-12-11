class Order < ApplicationRecord
  monetize :amount_cents

  belongs_to :movie
  belongs_to :user
end
