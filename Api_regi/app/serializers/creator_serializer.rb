class CreatorSerializer < ActiveModel::Serializer
  attributes :id, :email, :links
  def links
  end
end
