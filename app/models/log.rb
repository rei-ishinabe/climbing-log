class Log < ApplicationRecord
  belongs_to :routes
  has_many :users, through: :routes
  has_many :gyms, through: :routes
  validates :status, presence: true
end
