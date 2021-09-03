json.extract! photo, :id, :created_at, :updated_at, :name, :url, :description, :license, :visibility, :user_id
json.url photo_url(photo, format: :json)
