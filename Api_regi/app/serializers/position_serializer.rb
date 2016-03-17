class PositionSerializer < ActiveModel::Serializer
  attributes :id, :address, :longitude, :latitude, :links
  def links
    {
      self: api_v1_position_path(object.id),
      schools: api_v1_school_path(object.schools.id),
    }
  end
end
