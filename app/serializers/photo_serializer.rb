# == Schema Information
#
# Table name: photos
#
#  id          :bigint(8)        not null, primary key
#  description :text             default(""), not null
#  license     :integer(4)       default("copyright")
#  name        :string(150)
#  url         :string
#  visibility  :integer(4)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer(4)
#
class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :description, :license, :visibility
  belongs_to :user, serializer: UserPhotoIndexSerializer
end
