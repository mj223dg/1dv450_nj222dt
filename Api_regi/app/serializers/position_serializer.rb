class PositionSerializer < ActiveModel::Serializer
  attributes :id, :address, :longitude, :latitude, :links
  def links
      self: api_school_position_path(object.id)
  end
end
