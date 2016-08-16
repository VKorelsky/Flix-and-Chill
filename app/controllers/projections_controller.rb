class ProjectionsController < ApplicationController
  def index
    today = Date.today
    @futur_projections = Projection.where("date > ?", today).order(date: :desc)
    @past_projections = Projection.where("date > ?", today).order(date: :desc)
  end
end
