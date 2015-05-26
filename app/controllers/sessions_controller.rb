class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to root_url, notice: "Welcome back!"
      else
        redirect_to root_url, notice: "Unknown email or password."
      end
    else
      redirect_to root_url, notice: "Unknown email or password."
    end
  end
  
  def destroy
  	session.delete("user_id")
  		redirect_to root_url, notice: "You have signed out."
  end
  
end