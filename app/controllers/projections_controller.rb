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

      if result_geocoder = Geocoder.search(@searched_location).first
        if hash_locality = result_geocoder.address_components.find { |item| item["types"].first == "locality"  }
            @searched_location = hash_locality["long_name"]
        end
      end
    else
      @proposed_projections = @projections
    end

    @hash = Gmaps4rails.build_markers(@proposed_projections) do |projection, marker|
      marker.lat projection.latitude
      marker.lng projection.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
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
    if @projection.save
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
