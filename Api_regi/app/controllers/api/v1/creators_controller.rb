class Api::V1::CreatorsController < Api::V1::BaseController
  skip_before_action :authenticate
  before_action :offset_params
  def index
    respond_with Creator.limit(@limit).offset(@offset)
  end

  def show
    respond_with Creator.find(params[:id])
  end
end
