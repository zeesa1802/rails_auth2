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

  def show
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
    params.require(:user).permit(:email,:password,:password_confirmation)
  end

end