class Call < ActiveRecord::Base
  has_many :comments

  has_many :call_votes
  has_many :users, :through => :call_votes

  belongs_to :game
  belongs_to :commit_player, :class_name => 'Player', :foreign_key => :commit_player_id
  belongs_to :fouled_player, :class_name => 'Player', :foreign_key => :fouled_player_id
  belongs_to :ref

  def upvotes
    self.call_votes.where(:vote => true)
  end

  def downvotes
    self.call_votes.where(:vote => false)
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


