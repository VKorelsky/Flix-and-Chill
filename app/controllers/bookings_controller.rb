class BookingsController < ApplicationController

  def create
    url = params[:booking][:url]
    @booking = Booking.new(status: "accepted")
    @booking.user = current_user
    projection = Projection.find(params[:booking][:projection_id])
    @booking.projection = projection
    @booking.save
    redirect_to url
  end
end
