class ReactionController < ApplicationController
  before_action :authenticate_user!

  def reaction_handler
    post = Post.find(params[:post_id])
    # reaction = Reaction.where(user: current_user,post: post)
    reaction = Reaction.where(user: current_user, tweet: @tweet).first
    reaction_type = params[:reaction_type]
    if reaction.nil?
      reaction = Reaction.where(user: current_user,post: post).first
      reaction.destroy!
    else
      Reaction.create(user: current_user,post: post,reaction_type: reaction_type)
    end
    respond_to do |format|
      format.js{ }
    end
  end
end
