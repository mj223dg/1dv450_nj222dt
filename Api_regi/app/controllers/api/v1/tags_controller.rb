class Api::V1::TagsController < Api::V1::BaseController
  skip_before_action :authenticate

  def index
    if params[:school_id]
      school = School.find_by_id(params[:school_id])
      if school.present?
        respond_with school.tags
      else
        render json: { error: "There is no school that is connected to that id"}, status: :not_found and return
      end
    else
      respond_with Tag.all
    end
  end

  def show
    if params[:id]
      tag = Tag.find_by_id(params[:id])
      if tag.present?
        respond_with tag
      else
        render json: { error: "There is no tag that is connected to that id"}, status: :not_found and return
      end
    else
      render json: { error: "There id parameter don't seem to be valid, so nothing is found"}, status: :not_found and return
    end
  end
  
  def create
    if params[:school_id].blank?
      render json: { error: "Need a school id parameter to attach the tag to" }, status: :not_found and return 
    end
    
    school = School.find_by_id(params[:school_id])
    render json: { error: "There is no school that is connected to that id" },status: :not_found and return unless school.present?
    
    begin
      tag = Tag.new(tag_params)

      if tag.save
        school.tags << tag
        render json: tag, status: 201
      else
        render json: { errors: "There is a issue with saving the tag" }, status: 409 and return
      end
    end
  end
  private
    def tag_params
      json_params = ActionController::Parameters.new(JSON.parse(request.body.read))
      json_params.require(:tag).permit(:name)
    end

end

