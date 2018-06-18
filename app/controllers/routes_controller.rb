class RoutesController < ApplicationController
  def index
    area = Area.find(params[:area_id])
    render json: area.routes.select(:id, :name)
  end
end
