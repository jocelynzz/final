class MappingsController < ApplicationController

def create
	array = params["category_ids"]
	
	array.each{|category_id| 
	m = Mapping.new
    m.category_id = category_id
    m.post_id = params["post_id"]
    m.save
	}  
	
	redirect_to "/posts/#{params["post_id"]}" 

end

end
