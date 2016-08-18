class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_age_in_days = age_in_days(@user.birth_date)
    @user.first_name.capitalize!
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :projections, :email, :photo)
  end

  def age_in_days(birth_date)
    (Date.today - birth_date).to_i
  end
end
