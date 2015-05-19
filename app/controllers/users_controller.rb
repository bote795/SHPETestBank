class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :privileges, only:[:edit, :index, :update, :destroy_all, :destroy ]
  def index
    @users = User.all
  end
  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      params[:user].delete(:password) if params[:user][:password].blank?
      params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
      if @user.update_attributes(params[:user])
        flash[:notice] = "Successfully updated User."
        redirect_to users_path
      else
        render :action => 'edit'
      end
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
