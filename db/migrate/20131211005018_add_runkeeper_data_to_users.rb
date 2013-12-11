class AddRunkeeperDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :runkeeper_normal_picture, :string
    add_column :users, :runkeeper_medium_picture, :string
    add_column :users, :runkeeper_profile, :string
    add_column :users, :runkeeper_uid, :string
    add_column :users, :runkeeper_gender, :string
    add_column :users, :runkeeper_location, :string
  end
end
