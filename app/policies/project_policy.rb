class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      Project.where(project_manager_id:user.id)
    end
  end


  def show?
    record.project_manager_id == user.id || record.users
  end

  def new?
    user.role == "admin" or user.role == "project_manager"
  end

  def edit?
    update?
  end

  def update?
    record.project_manager_id == user.id
  end

  def destroy?
    user.role == "admin" || record.project_manager_id == user.id
  end

end
