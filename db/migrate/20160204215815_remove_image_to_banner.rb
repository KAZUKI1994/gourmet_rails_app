class RemoveImageToBanner < ActiveRecord::Migration
  def change
    remove_column :banners, :image, :string
  end
end
