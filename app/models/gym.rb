class Gym < ApplicationRecord
  mount_uploader :image, PhotoUploader
  has_many :logs
  has_many :users, through: :logs
  validates :name, presence: true, uniqueness: true
  validates :name_katakana, presence: true, uniqueness: true
  validates :name_alphabet, presence: true, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
