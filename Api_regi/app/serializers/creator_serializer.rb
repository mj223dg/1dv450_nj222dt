class CreatorSerializer < ActiveModel::Serializer
  attributes :id, :email, :links
  def links
    {
      schools: api_v1_creator_schools_path(object.id),
    } 
  end
end
