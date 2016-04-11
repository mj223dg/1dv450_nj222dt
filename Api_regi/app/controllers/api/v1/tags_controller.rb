class Api::V1::TagsController < Api::V1::BaseController
  skip_before_action :authenticate

  def index
    if params[:school_id]
      school = School.find_by_id(params[:school_id])
      respond_with school.tags
    else
      respond_with Tag.all
    end
  end

  def show
    respond_with Tag.find_by_id(params[:id])
  end
  def create
    if params[:school_id].blank?
      render json: { error: "Need a school" } and return 
    end
    
    school = School.find_by_id(params[:school_id])
    render json: { error: "School don't exist" } and return unless school.present?
    
    begin
      tag = Tag.new(tag_params)

      if tag.save
        school.tags << tag
        render json: tag, status: 201
      else
        render json: { errors: "there is a issue with the tags" }, status: 402
      end
    end
  end
  private
    def tag_params
      json_params = ActionController::Parameters.new(JSON.parse(request.body.read))
      json_params.require(:tag).permit(:name)
    end

end

