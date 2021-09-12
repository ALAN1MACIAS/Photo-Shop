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
require 'rails_helper'

class ValidatePhoto
  include ActiveModel::Validations
  validates_with PhotoValidator
  attr_accessor :description
end

RSpec.describe Photo, type: :model do
  describe 'Field validation' do
    it 'presence' do
      should validate_presence_of(:name)
      should validate_presence_of(:url)
      should validate_presence_of(:user_id)
      should define_enum_for(:license).with(%w[copyright copyleft creative_commons])
      should define_enum_for(:visibility).with(%w[pub pri])
    end

    it 'Validate BADWORDS: true' do
      validation = ValidatePhoto.new
      validation.description = 'hola mundo'

      expect(validation).to be_valid
    end

    it 'Recorded if all the fields are valid.' do
      user = FactoryBot.create(:user)
      photo = FactoryBot.create(:photo, user_id: user.id)
      photo.save

      expect(Photo.count).to eq(1)
    end
  end
end
