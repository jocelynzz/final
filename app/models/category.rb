class Category < ActiveRecord::Base

	has_many :mappings, :dependent => :destroy
	has_many :posts, :through=> :mappings

	
end
