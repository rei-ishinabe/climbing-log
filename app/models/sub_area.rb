class SubArea < ApplicationRecord
  belongs_to :area
  has_many :od_routes
  has_many :od_logs, through: :od_routes
  validates :sub_area_name, presence: true, uniqueness: { scope: :area,
    message: "同一エリア内に同じ名前のサブエリアが存在します", case_sensitive: false }
  validates :sub_area_name_katakana, presence: true, uniqueness: { scope: :area,
    message: "同一エリア内に同じ名前のサブエリアが存在します", case_sensitive: false }
  validates :sub_area_name_alphabet, presence: true, uniqueness: { scope: :area,
    message: "同一エリア内に同じ名前のサブエリアが存在します", case_sensitive: false }
end
