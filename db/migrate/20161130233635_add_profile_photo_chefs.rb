class AddProfilePhotoChefs < ActiveRecord::Migration
  def change
  	add_column :chefs, :profile_picture, :string
  end
end
