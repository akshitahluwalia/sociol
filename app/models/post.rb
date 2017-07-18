class Post < ActiveRecord::Base
  belongs_to :user
  has_many :reactions, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :source, SourceUploader
  IMAGEPOST = 0
  VIDEOPOST = 1
  TEXTPOST = 2
  SHARED = 3

  def liked? user_id
    return Reaction.find_by(post: self, user: User.find(user_id), reaction_type: Reaction::LIKE)
  end

  def angry? user_id
    return Reaction.find_by(post: self, user: User.find(user_id), reaction_type: Reaction::ANGRY)
  end

  def happy? user_id
    return Reaction.find_by(post: self, user: User.find(user_id), reaction_type: Reaction::HAPPY)
  end

  def sad? user_id
    return Reaction.find_by(post: self, user: User.find(user_id), reaction_type: Reaction::SAD)
  end

  def sub_post
    return Post.where(id: self.post_source).first
  end

  def shared_me_posts
    return Post.where(post_source: self.id)
  end

end