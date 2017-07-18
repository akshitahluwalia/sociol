class FriendMappingController < ApplicationController
  before_action :authenticate_user!

  def create
    user = params[:user]
    FriendMapping.create(first: current_user.id, second: user)
  end

  def remove
  end

end
