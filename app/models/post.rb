class Post < ActiveRecord::Base
	
	has_many :mappings
	has_many :categories, :through => :mappings

	belongs_to :user
	
	validates :title, :presence => true, :allow_nil => false
	validates :user_id, :presence => true, :allow_nil => false
	
end
