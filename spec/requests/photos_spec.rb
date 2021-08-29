require 'rails_helper'

RSpec.describe "Photos", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/photos/show"
      expect(response).to have_http_status(:success)
    end
  end

end
