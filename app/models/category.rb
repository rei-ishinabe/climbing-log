class Category < ApplicationRecord
  has_many :logs
  has_many :od_logs
end
