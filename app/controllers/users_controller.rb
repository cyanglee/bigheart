class UsersController < ApplicationController
  #before_filter :authenticate_user!

  def index
    authorize! :index, @user
    @users = User.all
  end

  def show
    authorize! :show, @user
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, @user
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user
    user = User.find(params[:id])
    unless user.id == current_user.id
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def users_stories
    @stories = Story.where(user_id: current_user.id)
  end

private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :uid, :provider)
    # , :provider, :uid)
  end
end