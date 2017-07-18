class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @comment = Comment.new
    @posts = current_user.feed
  end

  def network
    @users = User.all
    @friend_request = FriendRequest.new
  end
end
