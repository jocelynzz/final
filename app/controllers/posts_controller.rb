class PostsController < ApplicationController

 before_action :find_post, :only => [:show, :edit, :update, :destroy]

 def find_post
 	@post = Post.find_by(id: params[:id])
 end
 	
 def index
	@posts = Post.all
 end

 def show
 	
	if @post == nil
		redirect to posts_url
	end
 end

 def new
 end

 def create
 	post = Post.new
	post.userID = params[:userID],
	post.postID = params[:postID],
	post.title = params[:title],
	post.body = params[:body]
	post.save
	
	redirect_to posts_url
 end
 			
 def edit
 end

 def update
	@post.userID = params[:userID],
    @post.postID = params[:postID],
	@post.title = params[:title],
	@post.body = params[:body]
	@post.save
	
	redirect_to post_url(@post.id)
 end

 def delete
    @post.delete
    redirect_to posts_url
 end

end
	
	