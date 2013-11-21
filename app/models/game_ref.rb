class GameRef < ActiveRecord::Base
  belongs_to :ref
  belongs_to :game
end
