class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

	scope :order_by_most_recent, -> { order(created_at: :desc)}
	default_scope -> { order(created_at: :desc) }
end
