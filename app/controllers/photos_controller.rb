class PhotosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :new_session
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  include PhotosHelper

  def index
    @photos = possible_photos
  end

  def new
    @photo = Photo.new
  end

  def my_photos
    @photos = current_user.photos
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

  def edit
    @photo = current_user.photos.find_by_id(params[:id])
    render file: "#{Rails.root}/public/404.html", status: :not_found if @photo.nil?
  end

  def update
    @photo = current_user.photos.find_by_id(params[:id])
    if @photo.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found
    elsif @photo.update(photo_params)
      flash[:notice] = "The photo #{@photo.name} has been updated correctly"
      redirect_to photo_detail_path(@photo)
    else
      flash[:alert] = "There was an error saving the photo #{@photo.name}"
      render :edit
    end
  end

  def destroy
    @photo = current_user.photos.find_by_id(params[:id])
    @photo.destroy
    flash[:notice] = "The photo #{@photo.name} has been deleted correctly"
    redirect_to :my_photos
  end

  private

  def photo_params
    params.required(:photo).permit(:name, :url, :description, :license, :visibility)
  end
end
