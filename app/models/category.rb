class Category < ActiveRecord::Base

	has_many :mappings, :dependent => :delete_all
	has_many :posts, :through=> :mappings

	
end
