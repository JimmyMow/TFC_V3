  class ChallengeVote < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user
  belongs_to :game

end
