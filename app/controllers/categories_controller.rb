class CategoriesController < ApplicationController

def create
	t = Category.new
	t.category_id = params["category_id"]
	t.post_id = params["post_id"]	
end
