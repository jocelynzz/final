class Post < ActiveRecord::Base
	
	has_many :mappings
	has_many :categories, :through => :mappings
	
	validates :title, :presence => true
	#validates :user_id, :presence => true
	
end
