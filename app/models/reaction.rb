class Reaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  LIKE = 0
  HAPPY = 1
  SAD = 2
end
