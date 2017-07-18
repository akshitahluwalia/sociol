class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  NOT_NESTED = false
  NESTED = true
  def has_sub_comments?
    if Comment.where(comment_parent: self.id).nil? then return false else return true end
  end
  def sub_comments
    return Comment.where(comment_patent: self.id )
  end
end
