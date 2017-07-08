class ChangeFileNameToPhotos < ActiveRecord::Migration
  def change
  	remove_column :photos, :file_name, :string
  	add_column :photos, :images, :text
  end
end
