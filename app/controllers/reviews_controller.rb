class ReviewsController < ApplicationController
  def create
    @review = Review.new(content: params[:review][:content],rating: params[:review][:rating])
    booking = Booking.find(params[:review][:booking_id])
    @review.booking = booking
    @review.save
    redirect_to projection_path(booking.projection)
  end
  def update
    @review = Review.find(params[:review][:id])
    booking = Booking.find(params[:review][:booking_id])
    @review.content = params[:review][:content]
    @review.rating = params[:review][:rating]
    @review.booking = booking
    redirect_to projection_path(booking.projection)
  end
end
