class OdRoute < ApplicationRecord
  belongs_to :grade
  belongs_to :sub_grade
  belongs_to :sub_area
  belongs_to :category
  has_many :od_logs
  has_one :area, through: :sub_area

  def combined_grade
    "#{Grade.find_by(id: grade_id).grade}#{SubGrade.find_by(id: sub_grade_id).sub_grade.to_s unless sub_grade_id.nil?}"
  end

end
