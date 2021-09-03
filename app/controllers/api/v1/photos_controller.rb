class Api::V1::PhotosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_photo, only: %i[show update destroy]

  def index
    @photos = Photo.all
  end

  def show; end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render :show, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @photo.update(photo_params)
      render :show, status: :ok, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @photo.destroy
  end

  private

  def set_photo
    @photo = Photo.find_by_id(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:name, :url, :description, :visibility, :license, :user_id)
  end
end
