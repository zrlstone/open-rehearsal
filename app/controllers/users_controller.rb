class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @upcoming_rehearsals = @user.upcoming_rehearsals
  end

  private

  def user_params
    params.require(:user).permit(:username, :bio, :email, :avatar)
  end
end
