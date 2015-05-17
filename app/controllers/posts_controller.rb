class PostsController < ApplicationController

 before_action :find_post, :only => [:show, :edit, :update, :destroy]

 def find_post
 	@post = Post.find_by(id: params[:id])
 end
 	
 def index
	@posts = Post.all
	
 end

 def show
 	cookies["post_id"] = @post.id
	if @post == nil
		redirect to posts_url
	end
 end

 def new
 	@post = Post.new
 end

 def create
 	@post = Post.new
	@post.user_id = params[:user_id],
	@post.title = params[:title],
	@post.date = Time.now,
	@post.body = params[:body]
	
	if @post.save
		redirect_to post_url(@post.id)
	else 
		render 'new'
	end
 end
 			
 def edit
 end

 def update
	@post.user_id = params[:user_id],
	@post.title = params[:title],
	@post.date = params[:date],
	@post.body = params[:body]
	@post.save
	
	redirect_to post_url(@post.id)
 end

 def destroy
    @post.delete
    redirect_to posts_url
 end
 
end
	
	