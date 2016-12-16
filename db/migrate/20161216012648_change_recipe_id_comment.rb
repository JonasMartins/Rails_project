class ChangeRecipeIdComment < ActiveRecord::Migration
  def change
  	rename_column :comments, :recipe_id, :commentable_id
  end
end
