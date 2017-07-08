class Article < ActiveRecord::Base

  has_many :photos
  accepts_nested_attributes_for :photos

  validates :title, presence: true
	validates :body, presence: true
  validates :tag, presence: true
end
