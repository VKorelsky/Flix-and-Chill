class ProjectionsController < ApplicationController
  def index
    today = Date.today
    @futur_projections = Projection.where("date > ?", today).order(date: :desc)
    @past_projections = Projection.where("date > ?", today).order(date: :desc)
    @new_booking = Booking.new
  end

  def show
    @projection = Projection.find(params[:id])
  end

  def new
    @projection = Projection.new
  end

  def create
    @projection = Projection.new(projection_params)
    # @projection[:user] = @user => il faut remplir le user_id
    @projection.save
    redirect_to projection_path(@projection)
  end

  private

  # def set_projections
  #    @projection = Projection.find(params[:id])
  # end

  def projection_params
    params.require(:projection).permit(:name, :address, :movie, :date, :capacity)
  end
end
