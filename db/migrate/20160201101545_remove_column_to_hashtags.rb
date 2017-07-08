class RemoveColumnToHashtags < ActiveRecord::Migration
  def change
  	remove_column :hashtags, :oneyear_ani, :string
  	remove_column :hashtags, :onemonth_ani, :string
  end
end
