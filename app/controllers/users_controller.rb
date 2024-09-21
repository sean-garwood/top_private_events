class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show ]

  # show events user created
  def show
    @user = User.find(user_params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :id)
  end
end
