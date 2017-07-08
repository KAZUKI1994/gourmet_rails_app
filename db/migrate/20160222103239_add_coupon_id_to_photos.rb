class AddCouponIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :coupon_id, :intger
  end
end
