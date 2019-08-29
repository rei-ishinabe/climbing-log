class OdRouteReview < ApplicationRecord
  belongs_to :user
  belongs_to :od_route
end
