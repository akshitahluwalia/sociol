class FriendrequestController < ApplicationController
  before_action :authenticate_user!

  def create
    requested = params[:requested]
    if FriendRequest.where(requester: current_user.id,requested:requested).first.nil?
      FriendRequest.create(requester: current_user.id,requested:requested)
    end
    respond_to do |format|
      format.js{}
    end
  end

  def remove
    FriendRequest.destroy(params[:request_id])
    respond_to do |format|
      format.js{}
    end
  end
end

