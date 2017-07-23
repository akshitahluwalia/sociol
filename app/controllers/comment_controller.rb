class CommentController < ApplicationController
  before_action :authenticate_user!

  def add
    @post = Post.where(id: params[:post_id]).first
    content = params[:content]
    @comment = Comment.create(content: content, user_id: current_user.id, post_id: @post.id, nested: Comment::NOT_NESTED, comment_parent: nil)
    respond_to do |format|
      format.custom {redirect_to :root_path}
      format.js {}
    end
  end

  def add_nested
    comment_parent = Comment.where(id: params[:comment_parent]).first
    content = params[:content]
    @comment_container_id = params[:comment_container_id]
    @comment = Comment.create(content: content, user_id: current_user.id, post_id: comment_parent.post.id, nested: Comment::NESTED, comment_parent: comment_parent.id)
    respond_to do |format|
      format.js {}
    end
  end

  def remove
  end

  def update
  end
end
