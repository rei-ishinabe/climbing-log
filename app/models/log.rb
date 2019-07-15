class Log < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  validates :category_id, presence: true
  validates :status, presence: true
end
