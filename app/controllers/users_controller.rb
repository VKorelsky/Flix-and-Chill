class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    raise
    redirect_to
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
