class PositionSerializer < ActiveModel::Serializer
  attributes :id, :address, :longitude, :latitude, :links
  def links
      self: position_path(object.id),
      schools: schools_path(object.id)
  end
end
