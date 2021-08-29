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
require 'rails_helper'

RSpec.describe Photo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
