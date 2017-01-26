class UsersController < ApplicationController
  before_action :admin?

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end

  def admin?
    unless current_user.role == "admin"
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
