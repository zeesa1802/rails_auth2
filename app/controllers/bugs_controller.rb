class BugsController < ApplicationController
  before_action :set_project
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  # GET projects/1/bugs
  def index
    # puts("I am in bugs :-)")
    # puts(current_user.email)
    if(@project.project_manager_id == current_user.id || current_user.role == 'qa')
      @bugs = @project.bugs
    else
      @bugs = policy_scope(Bug.all)
    end
    # if current_user.role == "project_manager" || current_user.role == "admin" || current_user.role == "qa"
    #   @bugs = @project.bugs
    # else
    #   @bugs = @project.bugs.where(user_id: current_user.id)
    # end
    

  end

  # GET projects/1/bugs/1
  def show
  end

  # GET projects/1/bugs/new
  def new
    @status = []
    @status.push("created")
   
    # puts("I am bug")
    @users = @project.users.where(role: "developer")
    # puts(@project.users.where(role: "developer"))
    # x.users.where(role: "developer")
    # @users = User.all
    @bug = @project.bugs.build
  end

  # GET projects/1/bugs/1/edit
  def edit
    # @status = []
    # @status.push(@bug.status)

    # if current_user.role == "qa"
    #   @status.push("fixed")
    # elsif current_user.role == "developer"
      
    #   @status.push("in_review")
    # end

    @status = []
    @status.push(@bug.status)

    
    if current_user.role == "qa"
      if(@bug.status == "fixed")
        @status.push("created")
      elsif(@bug.status == "in_review")
        @status.push("fixed")
      end

    elsif current_user.role == "developer"
      if(@bug.status == "in_review" || @bug.status == "fixed")
      else
        @status.push("in_review")
      end
      
    end
    
    
    # puts(@status)
    # @status = "fixed"
    @users = @project.users.where(role: "developer")
  end

  # POST projects/1/bugs
  def create
    @bug = @project.bugs.build(bug_params)

    if @bug.save
      redirect_to(project_path(@project), notice: 'Bug was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT projects/1/bugs/1
  def update
    if @bug.update(bug_params)
      redirect_to(project_path(@project), notice: 'Bug was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/bugs/1
  def destroy
    @bug.destroy

    redirect_to project_path(@project, notice: 'Bug was deleted successfully.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_bug
      @bug = @project.bugs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bug_params
      params.require(:bug).permit(:bug_name, :detail, :status, :project_id, :user_id)
    end
end
