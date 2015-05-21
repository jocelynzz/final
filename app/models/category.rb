class Category < ActiveRecord::Base

	has_many :mappings
	has_many :posts, :through=> :mappings

	
end
