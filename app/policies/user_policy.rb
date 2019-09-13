class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    if user.nil?
      record.privacy_setting == 2
    else
      record == user || record.privacy_setting == 1 || user.admin
    end
  end
end
