class RenameAdminUserIdByUserIdToPhotoModel < ActiveRecord::Migration[6.0]
  def change
    rename_column :photos, :admin_user_id, :user_id
  end
end
