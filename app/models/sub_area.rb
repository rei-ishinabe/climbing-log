class SubArea < ApplicationRecord
  belongs_to :area
  validates :sub_area_name, presence: true
  validates :sub_area_name_katakana, presence: true
  validates :sub_area_name_alphabet, presence: true
end
