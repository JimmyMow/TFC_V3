class Comment < ActiveRecord::Base
  has_many :comment_votes

  belongs_to :call
  belongs_to :challenge
  belongs_to :user
end
