class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments_tables do |t|
    	t.integer :recipe_id
      t.string :chef_name
      t.text :body

      t.timestamps null: false
    end
  end
end
