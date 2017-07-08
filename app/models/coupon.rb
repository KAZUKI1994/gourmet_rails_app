class Coupon < ActiveRecord::Base
  has_one :photo
  belongs_to :restaurant, :autosave => true, :foreign_key => "restaurant_id"
  accepts_nested_attributes_for :photo, :restaurant

  validates :concept, presence: true
  validates :restaurant_id, presence: true
  validates :course, presence: true
  validates :price, presence: true
end
