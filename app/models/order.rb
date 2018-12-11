class Order < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}

  monetize :amount_cents

  belongs_to :movie
  belongs_to :user
end
