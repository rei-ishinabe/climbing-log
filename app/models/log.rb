class Log < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  validates :category, presence: true
  validates :grade, presence: true
  validates :sub_grade, presence: true
  validates :status, presence: true
end
