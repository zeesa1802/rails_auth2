class BugsController < ApplicationController
  before_action :set_project
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  # GET projects/1/bugs
  def index
    @bugs = @project.bugs
  end

  # GET projects/1/bugs/1
  def show
  end

  # GET projects/1/bugs/new
  def new
    # puts("I am bug")
    @users = @project.users.where(role: "developer")
    # puts(@project.users.where(role: "developer"))
    # x.users.where(role: "developer")
    # @users = User.all
    @bug = @project.bugs.build
  end

  # GET projects/1/bugs/1/edit
  def edit
    @users = @project.users.where(role: "developer")
  end

  # POST projects/1/bugs
  def create
    @bug = @project.bugs.build(bug_params)

    if @bug.save
      redirect_to([@bug.project, @bug], notice: 'Bug was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT projects/1/bugs/1
  def update
    if @bug.update(bug_params)
      redirect_to([@bug.project, @bug], notice: 'Bug was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/bugs/1
  def destroy
    @bug.destroy

    redirect_to project_bugs_url(@project)
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
