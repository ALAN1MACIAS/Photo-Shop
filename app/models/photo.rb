# == Schema Information
#
# Table name: photos
#
#  id            :bigint(8)        not null, primary key
#  description   :text             default(""), not null
#  license       :integer(4)       default("copyright")
#  name          :string(150)
#  url           :string
#  visibility    :integer(4)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :integer(4)
#
class Photo < ApplicationRecord
  belongs_to :admin_user

  enum license: %i[copyright copyleft creative_commons]
  enum visibility: %i[pub pri]

  validates :name, :url, :admin_user_id, presence: true
  validates :license, inclusion: { in: Photo.licenses }
  validates :visibility, inclusion: { in: Photo.visibilities }
end
