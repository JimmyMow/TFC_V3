class CommentVote < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user
  belongs_to :comment
end
