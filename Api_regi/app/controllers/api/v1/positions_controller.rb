class Api::V1::PositionsController < Api::V1::BaseController
  skip_before_action :authenticate
  before_action :offset_params
  respond_to :json
  
  def index
    respond_with Position.limit(@limit).offset(@offset)
  end

  def show
    respond_with Position.find(params[:id])
  end
end
