class ReactionController < ApplicationController
  before_action :authenticate_user!

  def reaction_handler
    @post = Post.find(params[:post_id])
    @reaction = Reaction.where(user: current_user, post: @post).first
    @reaction_type = params[:reaction_type]
    unless @reaction.nil?
      @reaction = Reaction.where(user: current_user, post: @post).first
      @reaction.destroy!
      if @reaction.reaction_type.to_i != @reaction_type.to_i
        Reaction.create(user: current_user, post: @post, reaction_type: @reaction_type)
      end
    else
      Reaction.create(user: current_user, post: @post, reaction_type: @reaction_type)
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end


