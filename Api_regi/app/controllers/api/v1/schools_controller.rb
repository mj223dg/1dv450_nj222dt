class Api::V1::SchoolsController < Api::V1::BaseController
  skip_before_action :authenticate

  respond_to :json

  def index
    respond_with School.all
  end
  
  def show
    school = School.find(params[:id])
    respond_with school, status: :ok
  end
  
  def create
  end
  
  def destroy
  end
  
  def update
  end
end
