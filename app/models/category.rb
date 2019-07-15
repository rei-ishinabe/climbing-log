class Category < ApplicationRecord
  has_many :logs
  has_many :grades
  has_many :sub_grades
end
