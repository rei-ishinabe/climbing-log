class User < ApplicationRecord
  mount_uploader :image, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :routes
  has_many :logs, through: :routes
  has_many :gyms, through: :routes
  validates :email, presence: true, uniqueness: true

  def best_boulder_sent
    routes.joins(:logs).where('routes.category_id = ? and logs.status_id < ?', 1, 4).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first
  end

  def best_lead_sent
    routes.joins(:logs).where('routes.category_id = ? and logs.status_id < ?', 2, 4).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first
  end
end
