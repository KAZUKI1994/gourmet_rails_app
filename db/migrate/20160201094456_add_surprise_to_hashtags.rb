class AddSurpriseToHashtags < ActiveRecord::Migration
  def change
    add_column :hashtags, :surprise, :string
  end
end
