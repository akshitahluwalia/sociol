class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @posts = Post.all
  end
end
