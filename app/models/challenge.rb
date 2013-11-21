class Challenge < ActiveRecord::Base
  has_many :challenge_comments
  has_many :comment_votes
  has_many :challenge_votes
  belongs_to :game

  def upvotes
    self.challenge_votes.where(:vote => true)
  end

  def downvotes
    self.challenge_votes.where(:vote => false)
  end

  def total_votes
    self.upvotes.count.to_i + self.downvotes.count.to_i
  end

  def score
    self.upvotes.count.to_i - self.downvotes.count.to_i
  end

  def percentage
    (self.downvotes.count.to_f / self.total_votes.to_f) * 100
  end
end
