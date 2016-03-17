class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :links
  def links
    {
      schools: api_v1_tag_schools_path(object.id)
    }
  end
end
