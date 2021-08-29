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
FactoryBot.define do
  factory :photo do
    name { "MyString" }
    url { "MyString" }
    description { "MyText" }
    license { 1 }
  end
end
