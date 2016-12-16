class AddChefIdComments < ActiveRecord::Migration
  def change
  	rename_table :comments_tables, :comments
  	add_column :comments, :chef_id, :integer
  end
end
