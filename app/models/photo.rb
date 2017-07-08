class Photo < ActiveRecord::Base
  belongs_to :posts, foreign_key: "post_id"
  belongs_to :restaurants, foreign_key: "restaurant_id"
  belongs_to :banners, foreign_key: "banner_id"
  belongs_to :coupons, foreign_key: "coupon_id"
  belongs_to :articles, foreign_key: "article_id"
  accepts_nested_attributes_for :posts, :restaurants
  mount_uploader :images, PhotoUploader
end
