class ChallengeComment < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user

  has_many :challenge_comment_votes
end
