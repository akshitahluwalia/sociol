class PostController < ApplicationController
  before_action :authenticate_user!
  def create
    content = params["post"]["content"]
    post_type = params["post"]["post_type"]
    source = params["post"]["source"]

    @post = Post.create(user:current_user,content: content,post_type: post_type,source:source)
    respond_to do |format|
      format.js{}
    end
  end

  def remove
    @post = Post.find(params[:id])
    if @post.id == current_user.id
      @post.destroy!
    end
    respond_to do |format|
      format.js { }
    end
  end

  def update
  end
end
