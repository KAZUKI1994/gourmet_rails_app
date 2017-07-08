class Banner < ActiveRecord::Base
	has_one :photo
	accepts_nested_attributes_for :photo

	validates :link, presence: true
	validates :finish_time, presence: true

end


