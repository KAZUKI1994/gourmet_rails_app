class Hashtag < ActiveRecord::Base
  belongs_to :post, foreign_key: "post_id"
  accepts_nested_attributes_for :post

  scope :birthday, -> {where(birthday: "#記念日")}
end
