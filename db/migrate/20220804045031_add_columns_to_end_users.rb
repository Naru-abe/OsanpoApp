class AddColumnsToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :name, :string, null: false
    add_column :end_users, :introduction, :string
    add_column :end_users, :is_deleted, :boolean, default: false, null: false
  end
end
