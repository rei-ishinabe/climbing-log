class Area < ApplicationRecord
  has_many :sub_areas
  has_many :od_routes, through: :sub_areas
  validates :area_name, presence: true, uniqueness: { scope: :prefecture,
    message: "同一都道府県内に同じ名前のエリアが存在します", case_sensitive: false }
  validates :area_name_katakana, presence: true, uniqueness: { scope: :prefecture,
    message: "同一都道府県内に同じ名前のエリアが存在します", case_sensitive: false }
  validates :region, presence: true
  validates :prefecture, presence: true
  validates :country, presence: true
end
