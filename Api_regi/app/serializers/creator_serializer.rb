class CreatorSerializer < ActiveModel::Serializer
  attributes :id, :email, :links
  def links
    {
      schools: api_v1_school_path(object.id),
    } 
  end
end
