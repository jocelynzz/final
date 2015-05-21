class Post < ActiveRecord::Base
	
	has_many :mappings
	has_many :categories, :through => :mappings
	
	validates :title, :presence => true, :allow_nil => false
	validates :user_id, :presence => true, :allow_nil => false
	
end
