class Api::V1::SchoolsController < Api::V1::BaseController
  skip_before_action :authenticate
  respond_to :json

  def index
    if params[:tag_id]
      tag = Tag.find_by_id(params[:tag_id])
      schools = tag.schools.limit(@limit).offset(@offset) if tag.present?
      elsif params[:creator_id]
      creator = Creator.find_by_id(params[:creator_id])
      schools = creator.schools.limit(@limit).offset(@offset) if creator.present?
    else
      schools = School.all
    end
    respond_with schools
  end
  
  def show
    school = School.find(params[:id])
    respond_with school, status: :ok
  end
  
  def create
    begin
      school = School.new(school_params.except(:tags,:position))
      school.creator = current_user
      school.position = Position.create(school_params[:position])
      
      if tags = school_params[:tags]
        tags.each do |tag|
          school.tags << Tag.where(tag).first_or_create
        end
      end
      
      if school.save
        render json: school, status: 201
      else
        render json: { errors: "something went wrong" }, status: 402
      end
    end
  end
  
  def destroy
  end
  
  def update
  end
  private
  def school_params
    json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
    json_params.require(:schools).permit(:name, :description, tags:[:name], position:[:address])
  end
end
