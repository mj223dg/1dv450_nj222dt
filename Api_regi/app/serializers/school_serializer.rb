class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :links
  has_one :position
  has_many :tags
  has_one :creator
  def links
    {
      self: api_v1_school_path(object.id),
      tags: api_v1_school_tags_path(object.id),
      creator: api_v1_creator_path(object.creator.id),
      position: api_v1_position_path(object.position.id),
    }
  end
end
