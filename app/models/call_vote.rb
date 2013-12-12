class CallVote < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :call
  belongs_to :user
  belongs_to :game
end
