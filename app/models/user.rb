class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:confirmable
  validates :username, presence: true,uniqueness: { case_sensitive: false }
  validates :name,presence: true
  validates :email, presence: true,uniqueness: { case_sensitive: false }
  has_many :posts,dependent: :destroy
  has_many :reactions,through: :posts
  mount_uploader :profile, ProfileUploader


  def feed
  #   TODO feed should be on follow basis
    return Post.all
  end
end
