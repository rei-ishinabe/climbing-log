class OdRouteReview < ApplicationRecord
  belongs_to :user
  belongs_to :od_route
  validates :rating, presence: true
  validates :comment, presence: true
  validates :privacy_setting, presence: true

  mount_uploader :image, PhotoUploader
end
