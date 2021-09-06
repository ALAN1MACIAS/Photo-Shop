class Api::V1::PhotosController < ApplicationController
  include PhotosHelper
  skip_before_action :verify_authenticity_token
  before_action :set_photo, only: %i[show]
  before_action :authenticate!, only: %i[create update destroy]

  def index
    @photos = possible_photos.paginate(page: params[:page], per_page: 5)
    render json: @photos
  end

  def show
    if @photo.nil?
      render json: { error: 'Photo not found' }, status: :not_found
    else
      render json: @photo
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = @current_user
    if @photo.save
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  def update
    @photo = @current_user.photos.find_by_id(params[:id])
    if @photo.nil?
      render json: { error: 'Photo not found' }, status: :not_found
    elsif @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @photo = @current_user.photos.find_by_id(params[:id])
    if @photo.nil?
      render json: { error: 'Photo not found' }, status: :not_found
    else
      @photo.destroy
    end
  end

  private

  def set_photo
    @possible_photos = possible_photos
    @photo = @possible_photos.find_by_id(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:name, :url, :description, :visibility, :license)
  end
end
