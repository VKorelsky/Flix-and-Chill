class ProjectionsController < ApplicationController
  def index
    today = Date.today
    @projections = Projection.where("date >= ?", today).order(date: :desc)
    @query_location = params[:search][:location]

    if !(params[:search].nil?)
      @found_projections = Projection.near(@query_location, 50)

      if @found_projections.empty?
        @proposed_projections = @projections
      end

      @searched_location = @query_location

      if hash_locality = Geocoder.search(@searched_location).first.address_components.find { |item| item["types"].first == "locality"  }
        @searched_location = hash_locality["long_name"]
      end
    else
      @proposed_projections = @projections
    end


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
