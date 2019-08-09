class Route < ApplicationRecord
  belongs_to :category
  belongs_to :grade
  belongs_to :user
  belongs_to :gym
  has_many :logs
  validates :route_type, presence: true
  validates :category_id, presence: true
  validates :grade_id, presence: true


  def latest_log_date
    logs.order(date: 'DESC').first.date
  end

  def best_status
    if logs.exists?
      Status.find_by(id: logs.order(status_id: 'ASC').first.status_id).status
    end
  end

  def sent
    if logs.exists?
      Status.find_by(id: logs.order(status_id: 'ASC').first.status_id).id < 4
    end
  end

  def combined_grade
    "#{Grade.find_by(id: grade_id).grade}#{SubGrade.find_by(id: sub_grade_id).sub_grade.to_s unless sub_grade_id.nil?}"
  end
end
