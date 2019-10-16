class OdLog < ApplicationRecord
  belongs_to :status
  belongs_to :od_route
  has_one :grade, through: :od_route
  belongs_to :user
  has_one :area, through: :od_route
end
