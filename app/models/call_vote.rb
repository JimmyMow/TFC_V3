class CallVote < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :call
  belongs_to :user



end
