class Review < ApplicationRecord
	validates :comment, presence: true, length: { minimum: 5, maximum: 500 }
  belongs_to :user
  belongs_to :shop

	scope :order_by_most_recent, -> { order(created_at: :desc)}
	default_scope -> { order(created_at: :desc) }
end
