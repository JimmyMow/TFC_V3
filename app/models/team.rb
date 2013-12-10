class Team < ActiveRecord::Base
  has_many :players
  has_many :games

  def total_games
    away_games = Game.where(:away_team_id => self.id)
    home_games = Game.where(:home_team_id => self.id)
    games_array = away_games + home_games
    return games_array
  end
end


