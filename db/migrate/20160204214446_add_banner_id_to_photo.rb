class AddBannerIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :banner_id, :integer
  end
end
