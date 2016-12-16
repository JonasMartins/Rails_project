class AddCommentIdLikes < ActiveRecord::Migration
  def change
  	 add_column :likes, :comment_id, :integer
  end
end
