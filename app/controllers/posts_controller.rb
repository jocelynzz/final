class PostsController < ApplicationController

 def index
	@posts = Post.all
 end

 def show
	@post = Post.find_by(id: params["id"])
	
	if @post == nil
		redirect to posts_url
	end
 end

 def new
 end

 def create
	Post.create userID: params[:userID],
				postID: params[:postID],
				title: params[:title],
				body: params[:body]
	redirect_to posts_url
 end
 			
 def edit
	@post = Post.find_by(id:params["id"])
 end

 def update
	@post = Post.find_by(id:params["id"])
	@post.update userID: params[:userID],
				 postID: params[:postID],
				 title: params[:title],
				 body: params[:body]
	
	redirect_to post_url(@post.id)
 end

 def delete
    Post.delete(params[:id])
    redirect_to posts_url
	
 end

end
	
	