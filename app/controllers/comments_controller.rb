class CommentsController < ApplicationController

def create
    c = Comment.new
    c.user_id = params["user_id"]
    c.post_id = params["post_id"]
    c.date = Time.now
    c.body = params["body"]
    c.save
    redirect_to "/posts/#{c.post_id}"   
end

end
