class AddApiKeyToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :api_key, :string

    User.find_each do |user|
      user.api_key = user.generate_api_key
      user.save
    end
  end
end
