class FriendRequest < ActiveRecord::Base
  def self.request_id requester,requested
    request = FriendRequest.find_by(requester: requester,requested: requested)
    if request.nil? then return nil else return request.id end
  end
end
