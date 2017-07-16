class PostController < ApplicationController
  before_action :authenticate_user!

  def create
    content = params["post"]["content"]
    post_type = params["post"]["post_type"]
    source = params["post"]["source"]

    @post = Post.create(user:current_user,content: content,post_type: post_type,source:source)
    respond_to do |format|
      return redirect_to root
    end
  end

  def remove
  end

  def update
  end
end
