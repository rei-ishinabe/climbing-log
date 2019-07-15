class Grade < ApplicationRecord
  belongs_to :category
  has_many :logs
end
