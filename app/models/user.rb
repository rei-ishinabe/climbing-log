class User < ApplicationRecord
  mount_uploader :image, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :logs
  has_many :gyms, through: :logs
  validates :email, presence: true, uniqueness: true

  def climbing_days
    logs.group("date").count.count
  end
end
