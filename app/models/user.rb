class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_secure_password

  has_many :comments
  has_many :challenges
  has_many :challenge_votes
  has_many :challenge_comments
  has_many :call_votes
  has_many :calls, :through => :call_votes
  has_many :comment_votes
  has_many :challenge_comment_votes

  def score
    (self.challenges.count * 5) + (self.call_votes.count * 2) + (self.comments.count)
  end
end
