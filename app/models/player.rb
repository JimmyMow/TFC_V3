class Player < ActiveRecord::Base
  has_many :calls
  has_many :challenges

  belongs_to :team
end
