class RemovepostIdFromhashtags < ActiveRecord::Migration
  def change
		remove_column :hashtags,  :post_id, :integer
  end
end
