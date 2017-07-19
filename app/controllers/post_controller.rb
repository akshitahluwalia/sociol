class PostController < ApplicationController
  before_action :authenticate_user!

  def create
    content = params["post"]["content"]
    source = params["post"]["source"]
    if source.nil?
      post_type = Post::TEXTPOST
    elsif
      post_type = Post::IMAGEPOST
    end
    @post = Post.create(user: current_user, content: content, post_type: post_type, source: source)
    respond_to do |format|
      format.js { }
      format.any{ redirect_to :root}
    end
  end

  def remove
    @post = Post.find(params[:id])
    if @post.user.id == current_user.id
      unless @post.shared_me_posts.nil?
        share_posts = @post.shared_me_posts
        puts share_posts
        share_posts.each do |post|
          post.destroy
        end
      end
      @post.destroy
    end
    respond_to do |format|
      format.js {}
    end
  end

  def update
  end

  def share
    @post = Post.find(params[:id])
    if @post.post_type == Post::SHARED
      @post = @post.sub_post
    end
    Post.create(user: current_user, post_type: Post::SHARED, content: nil, source: nil, post_source: @post.id)
    @sub_post = @post
    @post = Post.where(user: current_user, post_type: Post::SHARED, post_source: @post.id).first
    respond_to do |format|
      format.js {}
    end
  end
end
