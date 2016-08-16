class ProjectionsController < ApplicationController
  # before_action :set_projections, only: [:new, :create]

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
