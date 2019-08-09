class Gym < ApplicationRecord
  mount_uploader :image, PhotoUploader
  has_many :routes
  has_many :logs, through: :routes
  has_many :users, through: :routes
  validates :name, presence: true, uniqueness: true
  validates :name_katakana, presence: true, uniqueness: true
  validates :name_alphabet, presence: true, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def last_visit_date(user)
    routes.where(user_id: user.id).joins(:logs).order(date: 'DESC').first.logs.order(date: 'DESC').first.date if routes.where(user_id: user.id).exists? & routes.where(user_id: user.id).joins(:logs).exists?
  end
end
