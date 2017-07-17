class FriendRequest < ActiveRecord::Base
  def self.request_id requester,requested
    return FriendRequest.find_by(requester: requester,requested: requested).id
  end
end
