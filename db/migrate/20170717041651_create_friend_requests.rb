class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :requester
      t.integer :requested

      t.timestamps null: false
    end
  end
end
