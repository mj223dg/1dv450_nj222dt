class Api::V1::PositionsController < Api::V1::BaseController
  respond_to :json
  before_action :authenticate, only: [:index, :show]

  def index
    respond_with Position.all
  end

  def show
    respond_with Position.find(params[:id])
  end
end
