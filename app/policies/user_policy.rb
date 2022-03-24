class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    # @user.has_any_role? :admin, :newuser
    @user.role == "qa"
  end

  def edit?
    update?
  end

  def update?
    @user.role == "admin"
  end
end
