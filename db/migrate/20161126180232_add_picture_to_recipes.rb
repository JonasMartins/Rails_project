class AddPictureToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :picure, :string
  end
end
