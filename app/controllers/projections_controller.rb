class ProjectionsController < ApplicationController

  def show
    @projection = Projection.find(params[:id])
  end
end
