class PositionSerializer < ActiveModel::Serializer
  attributes :id, :address, :longitude, :latitude, :links
  def links
    {
      schools: api_v1_position_schools_path(object.id),
    }
  end
end
