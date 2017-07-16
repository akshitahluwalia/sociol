class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.integer :reaction_type

      t.timestamps null: false
    end
  end
end
