class UsersController < ApplicationController

  before_action :authorize, only: [:show]
  
  def new
    @user = User.new
  end

  def create
  #@user = User.new(params) #mass assignment is a bad practice in terms of security
  	#file_contents = params[:photo].read
  	
    @user = User.new(user_name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      redirect_to root_url, notice: "Thanks for signing up."
    else
      render "new"
    end
  end
  
  def authorize
   @user = User.find_by(id: params[:id])
   if session[:user_id].blank? || sesssio[:user_id] != @user.id
   		redirect_to root_url, notice: "Nice try!"
   end   
  end
  
  def show
  end
  			
end