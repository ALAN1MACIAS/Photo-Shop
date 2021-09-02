module PhotosHelper
  def possible_photos
    if current_user
      Photo.where(user: current_user).or(Photo.where(visibility: :pub))
    else
      Photo.where(visibility: :pub)
    end
  end
end
