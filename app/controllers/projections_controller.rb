class ProjectionsController < ApplicationController

  def show
    @projection = Projection.find(params[:id])
  end

  private

  def projection_params
    params.require(:projection).permit(:movie, :address, :date, :capacity )
  end

end
