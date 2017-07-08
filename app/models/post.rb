class Post < ActiveRecord::Base
  belongs_to :restaurant, :autosave => true, :foreign_key => "restaurant_id"
  has_one :hashtag ,:autosave => true, dependent: :destroy
  has_many :photos, :autosave => true
  belongs_to :user
  accepts_nested_attributes_for :hashtag, :restaurant, :photos

  validates :titile, presence: true
  validates :content, presence: true
  validates :time_zone, presence: true
  validates :total_eval, presence: true
  validates :quality_eval, presence: true
  validates :service_eval, presence: true
  validates :atomos_eval, presence: true
  validates :drink_eval, presence: true
  validates :partner_eval, presence: true
  validates :visit_date, presence: true
  validates :author_name, presence: true
  validates :author_college, presence: true
  validates :author_faculty, presence: true
  validates :author_gender, presence: true
  validates :author_grade, presence: true
  validates :relation, presence: true


end
