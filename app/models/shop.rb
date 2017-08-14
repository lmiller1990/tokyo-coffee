class Shop < ApplicationRecord
  validates :japanese_name, presence: true, length: { maximum: 50 }
	validates :station, presence: true, length: { maximum: 50 }

	belongs_to :district, optional: true
	has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy

	has_and_belongs_to_many :facilities

	scope :first_four, -> { order(created_at: :desc).limit(4) }
	scope :unapproved, -> { where(registration_approved: false) }
	scope :in_area, ->(district_id = nil) { where(district_id: district_id) }
end
