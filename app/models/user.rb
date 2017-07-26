class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_many :posts, dependent: :destroy
  has_many :reactions, through: :posts
  mount_uploader :profile, ProfileUploader

  def friends
    firstlist = FriendMapping.where(first:self.id).pluck(:second)
    secondlist = FriendMapping.where(second:self.id).pluck(:first)
    list = []
    firstlist.each do |element|
      list << element
    end
    secondlist.each do |element|
      list << element
    end

    return list
  end

  def feed
    feedlist = self.friends
    feedlist << self.id
    return Post.where(user_id: feedlist).order(created_at: :desc)
  end
  def suggestions

  end
end
