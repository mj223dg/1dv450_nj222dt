class PositionSerializer < ActiveModel::Serializer
  attributes :id, :address, :longitude, :latitude, :links
  def links
    {
      school: api_v1_position_school_path(object.id),
    }
  end
end
