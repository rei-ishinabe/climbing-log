class RoutePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    record.user == user || user.admin?
  end

  def update?
    record.user == user || user.admin?
  end

  def destroy?
    record.user == user
  end
end
