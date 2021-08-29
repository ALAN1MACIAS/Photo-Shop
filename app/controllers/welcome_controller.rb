class WelcomeController < ApplicationController
  def index
    @photos = Photo.where(visibility: :pub).last(5).reverse
  end
end
