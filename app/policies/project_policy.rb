class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # def show?
  #   puts("policyy")
  #   puts(@user.email)
  #   # puts(@project2.project_manager_id)
  #   # @user.id == @project.project_manager_id
  # end

  def new?
    @user.role == "admin" or @user.role == "project_manager"
  end
end
