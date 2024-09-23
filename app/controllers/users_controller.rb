class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show ]

  # show events user created
  def show
    @user = current_user
    expected_user = User.find(params[:id])
    if @user.id != expected_user.id
      flash[:alert] = "You are not authorized to view this page."
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :id)
  end
end
