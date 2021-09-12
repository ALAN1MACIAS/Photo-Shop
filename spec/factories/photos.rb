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
FactoryBot.define do
  factory :photo do
    name { Faker::Name.name }
    url { Faker::Company.logo }
    description { Faker::Company.suffix }
    license { Faker::Number.between(0, 2) }
    visibility { Faker::Number.between(0, 1) }
  end
end
