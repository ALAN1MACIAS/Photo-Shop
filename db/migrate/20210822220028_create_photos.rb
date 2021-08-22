class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :name, limit: 150
      t.string :url
      t.text :description, null: false, default: ''
      t.integer :license, default: 0

      t.timestamps
    end
  end
end
