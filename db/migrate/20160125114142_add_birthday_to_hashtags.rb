class AddBirthdayToHashtags < ActiveRecord::Migration
  def change
    add_column :hashtags, :birthday, :string
  end
end
