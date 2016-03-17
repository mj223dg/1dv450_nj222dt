class TagSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :links
  def links
    {
      self: api_v1_tag_path(object.id),
      schools: api_v1_tag_schools_path(object.id)
    }
  end
end
