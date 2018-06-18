class CragsController < ApplicationController
  def index
    region = Region.find(params[:region_id])
    render json: region.crags.select(:id, :name)
  end
end
