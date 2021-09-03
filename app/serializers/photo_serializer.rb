class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :description, :license, :visibility
  belongs_to :user, serializer: UserPhotoIndexSerializer
end
