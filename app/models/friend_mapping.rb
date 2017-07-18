class FriendMapping < ActiveRecord::Base
  def self.has_mapping first, second
    if FriendMapping.where(first: first, second: second).first.nil? && FriendMapping.where(first: second, second: first).first.nil?
      return false
    else
      return true
    end
  end
end
