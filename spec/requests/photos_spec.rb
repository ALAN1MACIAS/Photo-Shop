require 'rails_helper'

RSpec.describe 'Photos', type: :request do
  let(:first_user) { FactoryBot.create(:user) }

  let(:register_valid) {
    {
      name: Faker::Name.name,
      url: Faker::Company.logo,
      description: Faker::Company.suffix,
      license: 'copyright',
      visibility: 'pub',
      user_id: first_user.id
    }
  }

  let(:register_invalid) {
    {
      description: Faker::Company.suffix,
      license: 'copyright',
      visibility: 'pub'
    }
  }

  before(:each) do
    login_as first_user, scope: :user
  end

  describe 'GET /show' do
    it 'returns http success' do
      get photos_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create /photos' do
    context 'With valid parameters' do
      it 'Creates a new Photo' do
        expect { post photos_url, params: { photo: register_valid } }.to change(Photo, :count).by(1)
      end

      it 'Redirect to the created photo' do
        post photos_url, params: { photo: register_valid }
        expect(response).to redirect_to(photos_path(assigns(:photo)))
      end
    end

    context 'With invalid parameters' do
      it 'Does not create a new Photo' do
        expect { post photos_url, params: { photo: register_invalid } }.to change(Photo, :count).by(0)
      end

      it 'Redirects a message if the photo is not created.' do
        post photos_url, params: { photo: register_invalid }
        expect(response).to have_http_status(:ok)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
