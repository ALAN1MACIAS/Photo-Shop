class PhotosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :new_session
  before_action :authenticate_user!, only: %i[new create]
  include PhotosHelper

  def index
    @photos = possible_photos
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to photo_detail_path(@photo), notice: 'Photo created successfully'
    else
      flash[:alert] = "There was an error saving the photo: #{@photo.errors.full_messages.to_sentence}"
      render :new
    end
  end

  def show
    posible_photos = possible_photos
    @photo = posible_photos.find_by_id(params[:id])
    render file: "#{Rails.root}/public/404.html", status: :not_found if @photo.nil?
  end

  private

  def photo_params
    params.required(:photo).permit(:name, :url, :description, :license, :visibility)
  end
end
