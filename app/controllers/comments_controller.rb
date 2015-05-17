class CommentsController < ApplicationController

def create
    c = Comment.new
    c.user_id = cookies["user_id"],
    c.post_id = params["post_id"],
    c.date = Time.now,
    c.comment = params["comment"]
    c.save
    redirect_to "/posts/#{c.post_id}"   
end

end
