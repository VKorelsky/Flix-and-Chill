class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_age_in_days = age_in_days(@user.birth_date)

    # raise to check date.today format
    @future_projections= @user.projections.where("date >= ?", Date.today).order(date: :desc)
    @past_projections= @user.projections.where("date < ?", Date.today).order(date: :desc)
    @future_bookings= find_by_date(@user.bookings.all, "past_bookings")
    @past_bookings= find_by_date(@user.bookings.all, "future_bookings")

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

  def age_in_days(birth_date)
    (Date.today - birth_date).to_i
  end

  def find_by_date(booking_array, criterion)
    # finds matched bookings by date, without going through sql queries
    matched_bookings = []
    booking_array.each do |booking|
        if criterion == "past_bookings"
         matched_bookings << booking.projection if booking.projection.date < Date.today
        elsif criterion == "future_bookings"
         matched_bookings << booking.projection if booking.projection.date >= Date.today
      end
    end

    matched_bookings
  end

end
