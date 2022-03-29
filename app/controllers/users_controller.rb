class UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc)
    authorize @users
    # if current_user.has_any_role? :admin, :editor
    #   @users = User.order(created_at: :desc)
    # else
    #   redirect_to root_path, alert: "not authorize"
    # end
  end

  def new
    
    @user = User.new
  end

  def create
    puts("puts----------")
    @user = User.new(user_params)
    @user.save
    # redirect_to users_path

    respond_to do |format|
      if @user.save
       
        puts("user-------------")
        puts(@user.email)
        format.html { redirect_to users_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
    puts("it------show")
    @user = User.find(params[:id])
  end

  def edit
    puts("I am in edit---------")
    @roles = ["admin", "project_manager", "developer", "qa"]
    puts(@roles)
    @user = User.find(params[:id])
    authorize @user
  end


  def destroy
    puts("deleteteeee")
    user = User.find(params[:id])
    # puts(user.email)
    user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update
    puts("before sjsksksk")
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to users_url, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    puts("sajhkdsjhdjaskhdjksahjk--------")
    params.require(:user).permit(:email,:password,:password_confirmation, :role)
  end

end