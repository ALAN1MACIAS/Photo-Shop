class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    if current_user
      @photos = Photo.where(user: current_user).or(Photo.where(visibility: :pub))
    else
      @photos = Photo.where(visibility: :pub)
    end
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
    @photo = Photo.find_by_id(params[:id])
  end

  private

  def photo_params
    params.required(:photo).permit(:name, :url, :description, :license, :visibility)
  end
end
