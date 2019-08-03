class Route < ApplicationRecord
  belongs_to :category
  belongs_to :grade
  belongs_to :user
  belongs_to :gym
  has_many :logs

  def latest_log_date
    self.logs.order(date: "DESC").first.date
  end
end
