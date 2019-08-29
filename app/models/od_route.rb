class OdRoute < ApplicationRecord
  belongs_to :grade
  belongs_to :sub_grade
  belongs_to :sub_area
end
