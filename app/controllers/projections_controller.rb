class ProjectionsController < ApplicationController
  def index
    today = Date.today
    @projections = Projection.where("date >= ?", today).order(date: :desc)
    if params[:search].nil?
      @proposed_projections = @projections
      @found_projections = []
    else
      @query_location = params[:search][:location]
      if !(params[:search].nil?)
        @found_projections = Projection.near(@query_location, 50)

        if @found_projections.empty?
          @proposed_projections = @projections
        end

        @searched_location = @query_location

        if result_geocoder = Geocoder.search(@searched_location).first
          if hash_locality = result_geocoder.address_components.find { |item| item["types"].first == "locality"  }
              @searched_location = hash_locality["long_name"]
          end
        end
      else
        @proposed_projections = @projections
      end
    end

    @new_booking = Booking.new
  end

  def show
    set_projections
    @reviews = @projection.reviews
    @new_review = Review.new
    @new_booking = Booking.new
  end

  def new
    @projection = Projection.new
  end

  def create
    @projection = Projection.new(projection_params)
    @projection.user = current_user
    if @projection.save
      booking = Booking.create(projection: @projection, user: current_user, status: "accepted")
      redirect_to projection_path(@projection)
    else
      render :new
    end
  end

  def edit
    set_projections
  end

  def update
    set_projections
    if @projection.update(projection_params)
      redirect_to projection_path(@projection)
    else
      render :edit
    end
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
