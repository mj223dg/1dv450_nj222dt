class Api::V1::TagsController < Api::V1::BaseController
  skip_before_action :authenticate, only: [:index, :show]

  def index
    if (params[:school_id])
      school = School.find_by_id(params[:school_id])
      respond_with school.tags
    else
      respond_with Tag.all
    end
  end

  def show
    respond_with Tag.find_by_id(params[:id])
  end

  private
    def tag_params

    end

end

