class District < ApplicationRecord
  belongs_to :ward
  has_many :shops
end
