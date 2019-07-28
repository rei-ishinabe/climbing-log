class Log < ApplicationRecord
  belongs_to :route
  has_many :users, through: :routes
  has_many :gyms, through: :routes
  validates :status, presence: true
end
