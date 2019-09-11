class OdRoute < ApplicationRecord
  belongs_to :grade
  belongs_to :sub_grade
  belongs_to :sub_area
  belongs_to :category
  has_many :od_logs
  has_one :area, through: :sub_area
  validates :route_name, presence: true, uniqueness: { scope: :sub_area,
    message: "同一サブエリア内に同じ名前の課題が存在します", case_sensitive: false }
  validates :route_name_katakana, presence: true, uniqueness: { scope: :sub_area,
    message: "同一サブエリア内に同じ名前の課題が存在します", case_sensitive: false }
  validates :route_name_alphabet, presence: true, uniqueness: { scope: :sub_area,
    message: "同一サブエリア内に同じ名前の課題が存在します", case_sensitive: false }

  def combined_grade
    "#{Grade.find_by(id: grade_id).grade}#{SubGrade.find_by(id: sub_grade_id).sub_grade.to_s unless sub_grade_id.nil?}"
  end

end
