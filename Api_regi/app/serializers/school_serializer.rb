class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :links
  def links
  end
end
