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
      return true if record.privacy_setting == 2
    else
      return true if record == user || user.admin || record.privacy_setting >= 1
    end
  end
end
