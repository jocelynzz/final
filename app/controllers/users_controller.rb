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

end