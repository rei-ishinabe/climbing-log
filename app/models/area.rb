class Area < ApplicationRecord
  has_many :sub_areas
  has_many :od_routes, through: :sub_areas
  validates :area_name, presence: true, uniqueness: true
  validates :area_name_katakana, presence: true, uniqueness: true
  validates :area_name_alphabet, presence: true, uniqueness: true
  validates :region, presence: true
  validates :prefecture, presence: true
end
