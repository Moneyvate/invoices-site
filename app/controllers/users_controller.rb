class UsersController < ApplicationController
  before_filter :authenticate_user!
  layout "devise"

  def new
    redirect_to :authenticated_root
  end

  def create
    @user = User.create!(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :current_password, :remember_me)
  end
end
