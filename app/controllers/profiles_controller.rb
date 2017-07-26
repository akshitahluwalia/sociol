class ProfilesController < ApplicationController
  def profile
    @user = User.where(username: params[:username]).first
    @posts = Post.where(user: @user)
    @comment = Comment.new
  end

  def update
  end
end
