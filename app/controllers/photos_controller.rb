class PhotosController < ApplicationController
  def show
    @photo = Photo.find_by_id(params[:id])
  end
end
