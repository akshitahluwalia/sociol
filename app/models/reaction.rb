class Reaction < ActiveRecord::Base
  LIKE = 0
  HAPPY = 1
  SAD = 2
  ANGRY = 3
  belongs_to :user
  belongs_to :tweet
end
