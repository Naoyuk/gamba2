class AreasController < ApplicationController
  def index
    crag = Crag.find(params[:crag_id])
    render json: crag.areas.select(:id, :name)
  end
end
