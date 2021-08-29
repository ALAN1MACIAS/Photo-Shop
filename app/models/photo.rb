# == Schema Information
#
# Table name: photos
#
#  id          :bigint(8)        not null, primary key
#  description :text             default(""), not null
#  license     :integer(4)       default("copyright")
#  name        :string(150)
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Photo < ApplicationRecord
  enum license: %i[copyright copyleft creative_commons]

  validates :name, :url, presence: true
  validates :license, inclusion: { in: Photo.licenses }
end
