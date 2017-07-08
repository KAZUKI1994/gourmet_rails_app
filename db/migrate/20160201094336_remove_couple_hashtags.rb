class RemoveCoupleHashtags < ActiveRecord::Migration
  def change
  	remove_column :hashtags, :couple, :string
  end
end
