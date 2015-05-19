class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
  end
  def destroy_all
  	User.where("id != ?",current_user.id).delete_all
  	redirect_to users_path
  end
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to users_path
    end
  end 
end
