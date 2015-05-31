class RelationsController < ApplicationController
  before_action :current_user, :only => [:create, :destroy]

  def current_user
    @current_user = User.find_by(:id => session["user_id"])
  end

  def create
    @user = User.find(params[:followed_id])
    @current_user.follow(@user)
    redirect_to user_url(@user.id)
  end

  def destroy
    @user = Relation.find(params[:id]).followed
    @current_user.unfollow(@user)
    redirect_to user_url(@user.id)
  end

end
