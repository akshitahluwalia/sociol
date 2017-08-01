class FriendMappingController < ApplicationController
  before_action :authenticate_user!

  def create
    user = params[:user]
    FriendMapping.create(first: current_user.id, second: user)
    req = FriendRequest.where(requested: current_user.id, requester: user).first
    req.destroy
    respond_to do |format|
      format.js{ }
    end
  end

  def remove
    mapping = FriendMapping.find(params[:mapping_id])
    mapping.destroy
    respond_to do |format|
      format.js{ }
      format.html{ redirect_to '/'}
    end
  end
end
0