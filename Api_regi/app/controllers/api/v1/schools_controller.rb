class Api::V1::SchoolsController < Api::V1::BaseController
  skip_before_action :authenticate, only: [:index, :show]
  before_action :offset_params, only: [:index]
  respond_to :json


  def index
    if params[:tag_id]
      #Search by tag
      tag = Tag.find_by_id(params[:tag_id])
      schools = tag.schools.limit(@limit).offset(@offset) if tag.present?
      elsif params[:creator_id]
        # Search for creator
        creator = Creator.find_by_id(params[:creator_id])
        schools = creator.schools.limit(@limit).offset(@offset) if creator.present?
      elsif params[:search_name]
        # used to search for specific school
        # Case sensative
        schoolsearch = School.find_by name: params[:search_name]
          if schoolsearch.present?
            schools = schoolsearch
          else
            render json: { error: "The school you searched for don't exist"}, status: :not_found and return
          end
      elsif params[:search_location]
        # used to search by location adress
        # Sensative
        schoollocations = school_near(params[:search_location])
          if schoollocations == []
            render json: { error: "No schools near that adress"}, status: :not_found and return
          else
            schools = schoollocations
          end
    else
      schools = School.all
    end
    respond_with schools
  end
  def show
    if params[:id]
      school = School.find_by_id(params[:id])
      if school.present?
        respond_with tag, status: :ok
      else
        render json: { error: "There is no school that is connected to that id"}, status: :not_found and return
      end
    else
      render json: { error: "There id parameter don't seem to be valid, so nothing is found"}, status: :not_found and return
    end
  end
  
  def create
    school = School.new(school_params.except(:tags,:position))
    if school_params[:position].blank?
      render json: { error: "The school needs an adress"}, status: 409 and return
    end
    if Position.find_by_address(school_params[:position][:address])
      render json: { error: "There is already a school on that location"}, status: 409 and return 
    end
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
        render json: { errors: "There is a issue with saving the school" }, status: 409 and return
      end
    end
  end
  
  def destroy
    school = School.find_by_id(params[:id])
    if school.present?
      if current_user == school.creator
      else
        render json: { errors: "You are not the creator of the school" }, status: 409 and return
      end
    else
      render json: { errors: "The school you're trying to remove don't exist" }, status: :non_found and return
    end
    school.destroy
    render json: { message: "The school was removed" }, status: 200 and return
  end
  
  def update
    school = School.find_by_id(params[:id])
    if school.present?
      if current_user == school.creator
      else
        render json: { errors: "You are not the creator of the school" }, status: 409 and return
      end
    else
      render json: { errors: "The school you're trying to update don't exist" }, status: :non_found and return
    end
    begin
    if school.update(school_params.except(:tags,:position))
        render json: { action: "update", school: SchoolSerializer.new(school) }, status: 200 and return
    else
        render json: { errors: "Something went very wrong" }, status: 409 and return
    end
    end    
  end
  
  private
  def school_params
    json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
    json_params.require(:schools).permit(:name, :description, tags:[:name], position:[:address])
  end
  
  def school_near(street_location)
    schools = []
    nearaddress = Position.near(street_location, 5)
    nearaddress.each do |s|
      schools << s.school
    end
    schools
  end
end
