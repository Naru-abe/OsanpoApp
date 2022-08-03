class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :end_user_id, null: false
      t.integer :tag_id, null: false
      t.text :content, null: false
      t.string :station_name, null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
