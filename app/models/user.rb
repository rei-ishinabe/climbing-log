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
end
