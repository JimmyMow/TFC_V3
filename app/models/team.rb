class Team < ActiveRecord::Base
  has_many :players
  has_many :games
  has_many :fouls, through: :players, source: :fouls
  has_many :fouled, through: :players, source: :fouled

  def total_games
    away_games = Game.where(:away_team_id => self.id)
    home_games = Game.where(:home_team_id => self.id)
    games_array = away_games + home_games
    return games_array
  end
end


