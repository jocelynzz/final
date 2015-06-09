class PostsController < ApplicationController

 before_action :find_post, :only => [:show, :edit, :update, :destroy]
 before_action :require_user, :only => [:new, :edit, :update, :edit, :destroy]

 def find_post
 	@post = Post.find_by(id: params[:id])
 end

 def index

   # search bar
   if params["keyword"].present?
     @posts = Post.where("body LIKE ? or title LIKE ?", "%#{params[:keyword]}%","%#{params[:keyword]}%")
                  .limit(1000).order('date desc').page(params[:page]).per(5)

   else

     if params[:id].present?
       @user = User.find_by(id: session[:user_id])
       @url_path = request.original_url.to_s;

       # show friends' posts
       if @url_path.include?"friends"
         @users = @user.followings
         @posts = Post.where(:user_id => @users.pluck("id")).order('date desc').page(params[:page]).per(5)
       else
       # only show the signed in user's posts
         @page_id = "posts"
         @posts = @user.posts.order('date desc').page(params[:page]).per(5)
       end
       # home page shows all users' posts
     else
       @posts = Post.all.limit(1000).order('date desc').page(params[:page]).per(5)
     end

   end
 end

 def show
 	session["post_id"] = @post.id
 	@user_id = session["user_id"] 
	if @post == nil
		redirect to posts_url
    end
 end

 def require_user
	if session[:user_id].blank?
 		redirect_to root_url, notice: "You need to sign in first"
 	end
 end
	
 def new	
 	@post = Post.new
 	@user_id = session["user_id"]
 end

 def create
 	@post = Post.new
	@post.user_id = session["user_id"]
	@post.title = params[:title]
	@post.date = Time.now
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

	@post.user_id = session["user_id"]
	@post.title = params[:title]
	@post.date = params[:date]
	@post.body = params[:body]
	@post.save
	
	redirect_to post_url(@post.id)
 end

 def destroy
    @post.delete
    redirect_to posts_url
 end

 def get_friends
   @page_id = "friends_posts"
   @user = User.find_by(id: params[:id])
   @users = @user.followings
   @posts = Post.where(:user_id => @users.pluck("id")).order('date desc').page(params[:page]).per(5)
   render posts_url

 end
 
end
	
	