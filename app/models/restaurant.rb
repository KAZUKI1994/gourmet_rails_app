class Restaurant < ActiveRecord::Base
  has_many :posts
  has_many :photos
  has_many :coupons
  accepts_nested_attributes_for :posts, :photos, :coupons

  validates :name, presence: true
  validates :area, presence: true

end
