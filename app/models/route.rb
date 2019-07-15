class Route < ApplicationRecord
  belongs_to :category
  belongs_to :grade
  belongs_to :sub_grade
  belongs_to :user
  belongs_to :gym
end
