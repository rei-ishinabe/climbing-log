class Gym < ApplicationRecord
  has_many :logs
  has_many :users, through: :logs
  validates :name, presence: true, uniqueness: true
  validates :name_katakana, presence: true, uniqueness: true
  validates :name_alphabet, presence: true, uniqueness: true
end
