class CreateFriendMappings < ActiveRecord::Migration
  def change
    create_table :friend_mappings do |t|
      t.integer :first
      t.integer :second

      t.timestamps null: false
    end
  end
end
