class Area < ApplicationRecord
  has_many :sub_areas
  has_many :od_routes, through: :sub_areas
  validates :area_name, presence: true, uniqueness: { scope: :prefecture,
    message: "同一都道府県内に同じ名前のエリアが存在します", case_sensitive: false }
  validates :area_name_katakana, presence: true, uniqueness: { scope: :prefecture,
    message: "同一都道府県内に同じ名前のエリアが存在します", case_sensitive: false }
  validates :country, presence: true
  validates :region, presence: true, if: :country_jp?
  validates :prefecture, presence: true, if: :country_jp?

  def country_jp?
    country == "JP"
  end

  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end
end
