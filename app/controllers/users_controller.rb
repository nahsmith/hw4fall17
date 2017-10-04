class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end

  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    # will render app/views/users/show.<extension> by default
  end

  def index
    @users = User.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.create!(user_params)
    # if user does not exist
    flash[:notice] = "Welcome '#{@user.user_id}'. Your account has been created created."
    redirect_to movies_path
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.user_id} was successfully updated."
    redirect_to movies_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "#{@user.user_id}' deleted."
    redirect_to movies_path
  end
end