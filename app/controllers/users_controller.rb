class UsersController < ApplicationController

  before_action :authorize, only: [:show]
  before_action :find_user, except: [:create, :authorize]

  def find_user
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      redirect_to root_url, notice: "Thanks for signing up."
    else
      render "new"
    end

  end
  
  def authorize

   if session[:user_id].blank? 
   		redirect_to root_url, notice: "Nice try!"
   end

  end
  
  def show
    @page_id = "profile"
  end

  def following

    @title = "Following"
    @users = @user.followings
    render 'relations/show.html'

  end

  def followers

    @title = "Followers"
    @users = @user.followers
    render 'relations/show.html'

  end

  def posts

    @page_id = "posts"
    @posts = @user.posts.order('date desc').page(params[:page]).per(10)
    #change from root_url to posts/index.html because Kaminari threw errors
    render "posts/index.html"

  end

  def friends_posts

    @page_id = "friends_posts"
    @users = @user.followings
    @posts = Post.where(:user_id => @users.pluck("id")).order('date desc').page(params[:page]).per(10)
    render "posts/index.html"

  end
  			
end