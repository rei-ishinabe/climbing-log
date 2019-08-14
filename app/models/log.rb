class Log < ApplicationRecord
  belongs_to :route
  has_one :grade, through: :route
  has_many :users, through: :routes
  has_one :gym, through: :routes
  has_one :status
  validates :status_id, presence: true
end
