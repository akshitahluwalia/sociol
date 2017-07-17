class AddPostSourceToPost < ActiveRecord::Migration
  def change
    add_column :posts, :post_source, :integer
  end
end
