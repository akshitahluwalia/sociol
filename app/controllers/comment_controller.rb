class CommentController < ApplicationController
  before_action :authenticate_user!

  def add
    @post = Post.where(params[:post_id]).first
    content = params[:content]
    @comment = Comment.create(content: content,user_id:current_user.id,post_id:@post.id,nested:Comment::NOT_NESTED,comment_parent:nil)
    respond_to do |format|
      format.js{ return redirect_to '/'}
    end
  end

  def add_nested
  end

  def remove
  end

  def update
  end
end
