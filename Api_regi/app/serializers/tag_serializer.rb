class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :links
  def links
  end
end
