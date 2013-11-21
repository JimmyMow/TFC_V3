class ChallengeCommentVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge_comment

end
