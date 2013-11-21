class Game < ActiveRecord::Base
  has_many :calls
  has_many :challenges
  has_many :game_refs
  has_many :refs, through: :game_refs

  belongs_to :home_team, :class_name => 'Team', :foreign_key => :home_team_id
  belongs_to :away_team, :class_name => 'Team', :foreign_key => :away_team_id


  def things
    self.calls + self.challenges
  end
end
