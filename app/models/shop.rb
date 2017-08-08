class Shop < ApplicationRecord
  validates :japanese_name, presence: true, length: { maximum: 50 }

  belongs_to :district 
	has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
