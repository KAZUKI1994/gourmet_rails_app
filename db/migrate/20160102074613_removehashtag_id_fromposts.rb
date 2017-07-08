class RemovehashtagIdFromposts < ActiveRecord::Migration
  def change
		add_column :hashtags, :post_id, :integer
		remove_column :posts, :hashtag_id, :integer
  end
end
