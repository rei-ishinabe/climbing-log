class SubGrade < ApplicationRecord
  belongs_to :category
  has_many :logs
end
