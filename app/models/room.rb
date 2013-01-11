class Room < ActiveRecord::Base
	has_many :reviews, :dependent => :destroy
	belongs_to :user
	attr_accessible :description, :location, :title

	scope :most_recent, order('created_at DESC')
	
	def complete_name
		"#{title}, #{location}"		
	end
end
