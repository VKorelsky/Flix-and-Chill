class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @user_age_in_years = age(@user.birth_date)

    # raise to check date.today format
    @future_projections= @user.projections.where("date >= ?", Date.today).order(date: :desc)
    @past_projections= @user.projections.where("date < ?", Date.today).order(date: :desc)

    # Loop to get the projections & remove duplicate projections
    @future_bookings = []
    @user.bookings.all.each do |booking|
      (@future_bookings << booking.projection) if (booking.projection.date >= Date.today)
    end
    @future_bookings.reject! {|projection| @future_projections.include?(projection)}

    @past_bookings = []
    @user.bookings.all.each do |booking|
      (@past_bookings << booking.projection) if (booking.projection.date < Date.today)
    end
    @past_bookings.reject! {|projection| @past_projections.include?(projection)}


    # activity sets
    @future_activity= [@future_projections, @future_bookings].flatten
    @past_activity = [@past_projections, @past_bookings].flatten

    # helper
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

  def age(birth_date)
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end
end
