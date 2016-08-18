class ProjectionsController < ApplicationController
  def index
    today = Date.today
    @projections = Projection.all.order(date: :asc)
    @found_projections = @projections.where("date >= ?", today)
    unless params[:search].nil?
      unless params[:search][:first_day].nil?
       @found_projections = @found_projections.where("date >= ?", params[:search][:first_day].to_date)
      end
      unless params[:search][:last_day].nil?
        @found_projections = @found_projections.where("date <= ?", params[:search][:last_day].to_date)
      end
      unless params[:search][:location].nil?
        @searched_location = params[:search][:location]
        @found_projections = @found_projections.where("address = ?", @searched_location)
      end
    end
    @found_projections.order(date: :asc)
    @new_booking = Booking.new
  end

  def show
    set_projections
    @reviews = @projection.reviews
    @new_review = Review.new
  end

  def new
    @projection = Projection.new
  end

  def create
    @projection = Projection.new(projection_params)
    @projection.user = current_user
    @projection.save
    redirect_to projection_path(@projection)
  end

  def edit
    set_projections
  end

  def update
    set_projections
    @projection.update(projection_params)
    redirect_to projection_path(@projection)
  end

  private

  def set_projections
    @projection = Projection.find(params[:id])
  end

  def projection_params
    params.require(:projection).permit(:name, :address, :movie, :date, :capacity, :photo)
  end

  # def clean_query_string

  # end
end
