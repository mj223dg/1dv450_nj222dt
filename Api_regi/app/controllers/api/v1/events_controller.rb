class Api::V1::EventsController < Api::V1::BaseController
  def index
    respond_with Event.all
  end
  
  def show
    def show
    school = Event.find(params[:id])
    respond_with school, status: :ok
    end
  end
end
