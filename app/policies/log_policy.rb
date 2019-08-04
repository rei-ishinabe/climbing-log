class LogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.route.user == user || user.admin?
  end

  def destroy?
    record.route.user == user || user.admin?
  end
end
