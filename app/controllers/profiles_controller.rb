class ProfilesController < ApplicationController
  def profile
    @user = User.where(username: params[:username]).first
    @posts = Post.where(user: @user)
    puts @user
    puts @posts
  end

  def update
  end
end
