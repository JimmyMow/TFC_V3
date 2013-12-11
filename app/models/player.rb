class Player < ActiveRecord::Base
  has_many :commit_calls, :class_name => 'Call', :foreign_key => 'commit_player_id'
  has_many :fouled_calls, :class_name => 'Call', :foreign_key => 'fouled_player_id'
  has_many :challenges
  has_many :fouls, through: :commit_calls, source: :commit_player
  has_many :fouled, through: :fouled_calls, source: :fouled_player
  belongs_to :team
end
