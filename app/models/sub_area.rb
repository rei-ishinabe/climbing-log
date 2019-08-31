class SubArea < ApplicationRecord
  belongs_to :area
  has_many :od_routes
  validates :sub_area_name, presence: true
  validates :sub_area_name_katakana, presence: true
  validates :sub_area_name_alphabet, presence: true
end
