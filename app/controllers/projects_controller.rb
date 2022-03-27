class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @users = User.all
    @added_users = false
  end

  # GET /projects/1/edit
  def edit
    # puts("start")
    # puts(@project.name)
    @added_users = @project.users

    # puts(@added_users)
    @users = User.all
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    puts("start")

    # users = params[:users]

    # users.each do |user|
    #   add_user = User.find_by id: user
    #   puts(add_user.email)
    # end

    # add_user = User.find_by id: users[2]
    # puts(add_user.email)
    

    respond_to do |format|
      if @project.save
        saved_project = Project.find_by id: @project.id
        users = params[:users]

        users.each do |user|
          add_user = User.find_by id: user
          saved_project.users.push(add_user)
          # puts(add_user.email)
        end
        
        
        puts(saved_project.name)
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      puts("start")
      # puts(@project.users)
      users = params[:users]
      saved_project = @project
      ids_array = saved_project.users.ids
      puts("already")
      puts(ids_array)
      puts("from checboxes")
      puts(users)

      puts("condition")

      x = []
      users.each do |user|
        x.push(user.to_i)
      end
      ids_array.each do |id_|
        puts(x.include?(id_))
      end
      ids_array.each do |id_|
        if !(x.include?(id_))
          y = UserProject.where(project_id: saved_project.id, user_id: id_)
          y.delete_all
          # user_delete = saved_project.users.find_by id:id_
          # user_delete.delete
        end
      end
    # end

      # x = []
      # puts(ids_array)
      # users.each do |user|
      #   x.push(user)
      #   if (ids_array.include?(user=>'id'))
      #     puts("found")
      #   end
      # end
      # puts(x)
      # puts(params[:id])
      # added_users.ids.include?(user.id)
      # puts(ids_array.include?(4))
      # puts(ids_array.include?(5))
      

      # users.each do |user|
      #   puts(ids_array.include?(user=>'id'))
      # end
     

      users.each do |user|
        # puts(ids_array.include?(user.to_i))
        if !(ids_array.include?(user.to_i))
          add_user = User.find_by id: user
          saved_project.users.push(add_user)
        end
        
      end
        
        # puts(add_user.email)
      # end

      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name)
    end
end
